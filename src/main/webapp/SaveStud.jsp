<%@ page import="org.slf4j.Logger" %>
<%@ page import="org.slf4j.LoggerFactory" %>
<%@ page import="org.in.placementv2.model.Student" %>
<%@ page import="org.in.placementv2.util.JspString" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.in.placementv2.model.StudentDAO" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="org.json.simple.parser.JSONParser" %>
<%@ page import="java.util.ListIterator" %>
<%@ page import="org.in.placementv2.model.Skill" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.HashSet" %>
<%@ page import="org.in.placementv2.util.JsonPropertyString" %>
<%@ page import="java.io.IOException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    public void saveStudent(HttpServletRequest request, HttpServletResponse response, JspWriter out) throws IOException {
        Logger log = LoggerFactory.getLogger(this.getClass());
        String errLabel = JsonPropertyString.ERROR;
        JSONObject object = new JSONObject();
        log.error("SAVEATUD-21: Entering SaveStud");
        try {
            Student student = new Student();

            String studentId = request.getParameter(JspString.ID_FIELD);
            if (studentId != null && !studentId.isEmpty()) {
                student.setId(Long.parseLong(studentId));
            }
            String name = request.getParameter(JspString.NAME_FIELD);
            if (name != null && !name.isEmpty()) {
                student.setName(name);
            }
            String email = request.getParameter(JspString.EMAIL_ID_FIELD);
            if (email != null && !email.isEmpty()) {
                student.setEmailid(email);
                log.error("SAVEATUD-36: EmailId=" + email);
            }
            String isPlaced = request.getParameter(JspString.IS_PLACED_FIELD);
            if (isPlaced != null && !isPlaced.isEmpty()) {
                student.setPlaced(Boolean.parseBoolean(isPlaced));
            }
            String sscMarks = request.getParameter(JspString.SSC_MARKS_FIELD);
            if (sscMarks != null && !sscMarks.isEmpty()) {
                student.setSscmarks(Float.parseFloat(sscMarks));
            }
            String hscMarks = request.getParameter(JspString.HSC_MARKS_FIELD);
            if (hscMarks != null && !hscMarks.isEmpty()) {
                student.setHscmarks(Float.parseFloat(hscMarks));
            }
            String mcaMarks = request.getParameter(JspString.MCA_MARKS_FIELD);
            if (mcaMarks != null && !mcaMarks.isEmpty()) {
                student.setMcamarks(Float.parseFloat(mcaMarks));
            }

            JSONParser jsonParser = new JSONParser();
            JSONArray skillJsonArray = (JSONArray) jsonParser.parse(request.getParameter(JspString.SKILL_SELECT_FIELD));
            ListIterator iterator = skillJsonArray.listIterator();
            Set skillSet = new HashSet();
            Set studentSet = new HashSet();
            studentSet.add(this);
            while (iterator.hasNext()) {
                long o = Long.parseLong((String) iterator.next());
                Skill skill = new Skill();
                skill.setId(o);
                skill.setStudents(studentSet);
                skillSet.add(skill);
            }
            student.setSkills(skillSet);

            StudentDAO studentDAO = new StudentDAO();
            studentDAO.save(student);
            object.put(JsonPropertyString.SUCCESS, "Student : " + student.getName() + " saved to database");

        } catch (Exception e) {
            log.error("Error Occurred: " + e.getMessage());
            object.put(errLabel, e.getMessage());
        } finally {
            out.print(object);
            out.flush();
        }
    }
%>