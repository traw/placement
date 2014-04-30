<%@ page import="org.in.placementv2.util.JspString" %>
<%@ page import="org.in.placementv2.util.JsonPropertyString" %>
<%@ page import="org.in.placementv2.model.*" %>
<%@ page import="org.json.simple.parser.JSONParser" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="java.util.ListIterator" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.HashSet" %>
<%@ page import="org.slf4j.Logger" %>
<%@ page import="org.slf4j.LoggerFactory" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.util.Iterator" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Logger logger = LoggerFactory.getLogger(this.getClass());
    String object = request.getParameter(JsonPropertyString.PARAM_OBJ);
    String action = request.getParameter(JsonPropertyString.PARAM_ACTION);
    logger.error("SAVE_ACTION: OBJ= " + object + ", ACT= " + action);
    if (object.equals(JspString.OBJ_STUD)) {
        hadleStudentAction(action, request, response, out);
    } else if (object.equals(JspString.OBJ_COMP)) {
        handleCompanyAction(action, request, response, out);
    } else if (object.equals(JspString.OBJ_SKILL)) {
        handleSkillAction(action, request, response, out);
    }
%><%!
    private void handleSkillAction(String action, HttpServletRequest request, HttpServletResponse response, JspWriter out) {
        Logger log = LoggerFactory.getLogger(this.getClass());
        String errLabel = JsonPropertyString.ERROR, errMsg;
        JSONObject object = new JSONObject();
        try {

            SkillDAO skillDAO = new SkillDAO();
            Skill skill = null;

            String skillID = request.getParameter(JspString.ID_FIELD);
            if (action.equals(JspString.ACTION_EDIT) || action.equals(JspString.ACTION_DEL)) {
                if (skillID == null || skillID.isEmpty()) {
                    errMsg = "Not ID is provided";
                    throw new RuntimeException(errMsg);
                } else {
                    skill = skillDAO.findById(Long.parseLong(skillID));
                }
            } else if (action.equals(JspString.ACTION_ADD)) {
                skill = new Skill();
            }

            String skillId = request.getParameter(JspString.ID_FIELD);
            if (skillId != null && !skillId.isEmpty()) {
                skill.setId(Long.parseLong(skillId));
            }
            String name = request.getParameter(JspString.NAME_FIELD);
            if (name != null && !name.isEmpty()) {
                skill.setName(name);
            }

            if (action.equals(JspString.ACTION_ADD) || action.equals(JspString.ACTION_EDIT)) {
                skillDAO.save(skill);
            } else if (action.equals(JspString.ACTION_DEL)) {
                skillDAO.delete(skill);
            }
            object.put(JsonPropertyString.SUCCESS, "Skill : " + skill.getName() + " saved to database");

        } catch (Exception e) {
            log.error("Error Occurred: " + e.getMessage());
            object.put(errLabel, e.getMessage());
        } finally {
            try {
                out.print(object);
                out.flush();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }


    private void hadleStudentAction(String action, HttpServletRequest request, HttpServletResponse response, JspWriter out) {
        Logger log = LoggerFactory.getLogger(this.getClass());
        String errLabel = JsonPropertyString.ERROR, errMsg;
        JSONObject object = new JSONObject();
        log.error("SAVEATUD-21: Entering SaveStud");
        try {
            StudentDAO studentDAO = new StudentDAO();
            Student student = null;

            String studID = request.getParameter(JspString.ID_FIELD);
            if (action.equals(JspString.ACTION_EDIT) || action.equals(JspString.ACTION_DEL)) {
                if (studID == null || studID.isEmpty()) {
                    errMsg = "Not ID is provided";
                    throw new RuntimeException(errMsg);
                } else {
                    student = studentDAO.findById(Long.parseLong(studID));
                }
            } else if (action.equals(JspString.ACTION_ADD)) {
                student = new Student();
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

            if (action.equals(JspString.ACTION_ADD) || action.equals(JspString.ACTION_EDIT)) {
                studentDAO.save(student);
            } else if (action.equals(JspString.ACTION_DEL)) {
                studentDAO.delete(student);
            }
            object.put(JsonPropertyString.SUCCESS, "Student : " + student.getName() + " saved to database");

        } catch (Exception e) {
            log.error("Error Occurred: " + e.getMessage());
            object.put(errLabel, e.getMessage());
        } finally {
            try {
                out.print(object);
                out.flush();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void handleCompanyAction(String action, HttpServletRequest request, HttpServletResponse response, JspWriter out) {
        Logger log = LoggerFactory.getLogger(this.getClass());
        String errLabel = JsonPropertyString.ERROR, errMsg;
        JSONObject object = new JSONObject();
        log.error("SAVECOMAP-19: Entering SaveCompany");
        try {
            CompanyDAO companyDAO = new CompanyDAO();
            Company company = null;
            String compId = request.getParameter(JspString.ID_FIELD);
            if (action.equals(JspString.ACTION_EDIT) || action.equals(JspString.ACTION_DEL)) {
                if (compId == null || compId.isEmpty()) {
                    errMsg = "Not ID is provided";
                    throw new RuntimeException(errMsg);
                } else {
                    company = companyDAO.findById(Long.parseLong(compId));
                }
            } else if (action.equals(JspString.ACTION_ADD)) {
                company = new Company();
            }

            String name = request.getParameter(JspString.NAME_FIELD);
            if (name != null && !name.isEmpty()) {
                company.setName(name);
                log.error("SAVECOMAP-31");
            }
            String description = request.getParameter(JspString.DESCRIPTION_FIELD);
            if (description != null && !description.isEmpty()) {
                company.setDescription(description);
                log.error("SAVECOMAP-36");
            }
            String sscMarks = request.getParameter(JspString.SSC_MARKS_FIELD);
            if (sscMarks != null && !sscMarks.isEmpty()) {
                company.setSscmarks(Float.parseFloat(sscMarks));
                log.error("SAVECOMAP-41");
            }
            String hscMarks = request.getParameter(JspString.HSC_MARKS_FIELD);
            if (hscMarks != null && !hscMarks.isEmpty()) {
                company.setHscmarks(Float.parseFloat(hscMarks));
                log.error("SAVECOMAP-46");
            }
            String mcaMarks = request.getParameter(JspString.MCA_MARKS_FIELD);
            if (mcaMarks != null && !mcaMarks.isEmpty()) {
                company.setMcamarks(Float.parseFloat(mcaMarks));
                log.error("SAVECOMAP-50");
            }

            if (request.getParameter(JspString.SKILL_SELECT_FIELD) != null) {
                JSONParser jsonParser = new JSONParser();
                JSONArray skillJsonArray = (JSONArray) jsonParser.parse(request.getParameter(JspString.SKILL_SELECT_FIELD));
                ListIterator iterator = skillJsonArray.listIterator();

                Set studentSkillSet = company.getSkills();
                Iterator studSkillIterator = studentSkillSet.iterator();
                while (iterator.hasNext()) {
                    long o = Long.parseLong((String) iterator.next());
                    if (action.equals(JspString.ACTION_ADD)) {
                        Skill skill = new Skill();
                        skill.setId(o);
                        studentSkillSet.add(skill);
                    } else if (action.equals(JspString.ACTION_EDIT)) {
                        while (studSkillIterator.hasNext()) {
                            Skill skill = (Skill) studSkillIterator.next();
                            if (skill.getId() == o) {
                                studSkillIterator.remove();
                            }
                        }
                    }
                }
            }
            log.error("SAVECOMAP-59: Company Name= " + company.getName());

            if (action.equals(JspString.ACTION_ADD) || action.equals(JspString.ACTION_EDIT)) {
                companyDAO.save(company);
            } else if (action.equals(JspString.ACTION_DEL)) {
                companyDAO.delete(company);
            }

            log.error("SAVECOMP-62: Company = " + company.getName() + "reflected to database");
            object.put(JsonPropertyString.SUCCESS, "Company : " + company.getName() + " reflected to database");

        } catch (Exception e) {
            log.error("Error Occurred: " + e.getMessage());
            log.error("SAVECOMP-66:Error Occurred: " + e.getMessage());
            object.put(errLabel, e.getMessage());
        } finally {
            try {
                out.print(object);
                log.error("SAVECOMP-71:flushing output"
                        + (object.get(JsonPropertyString.SUCCESS) != null ?
                        object.get(JsonPropertyString.SUCCESS) :
                        object.get(JsonPropertyString.ERROR)));
                out.flush();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
%>