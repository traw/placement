<%@ page import="org.slf4j.Logger" %>
<%@ page import="org.slf4j.LoggerFactory" %>
<%@ page import="org.in.placementv2.util.JspString" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="org.json.simple.parser.JSONParser" %>
<%@ page import="java.util.ListIterator" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.HashSet" %>
<%@ page import="org.in.placementv2.util.JsonPropertyString" %>
<%@ page import="java.io.IOException" %>
<%@ page import="org.in.placementv2.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    public void saveCompany(HttpServletRequest request, HttpServletResponse response, JspWriter out) throws IOException {
        Logger log = LoggerFactory.getLogger(this.getClass());
        String errLabel = JsonPropertyString.ERROR;
        JSONObject object = new JSONObject();
        log.error("SAVECOMAP-19: Entering SaveCompany");
        try {
            Company company = new Company();

            String compId = request.getParameter(JspString.ID_FIELD);
            if (compId != null && !compId.isEmpty()) {
                company.setId(Long.parseLong(compId));
            }
            String name = request.getParameter(JspString.NAME_FIELD);
            if (name != null && !name.isEmpty()) {
                company.setName(name);
            }
            String description = request.getParameter(JspString.COMP_DESCRIPTION);
            if (description != null && !description.isEmpty()) {
                company.setDescription(description);
            }
            String sscMarks = request.getParameter(JspString.SSC_MARKS_FIELD);
            if (sscMarks != null && !sscMarks.isEmpty()) {
                company.setSscmarks(Float.parseFloat(sscMarks));
            }
            String hscMarks = request.getParameter(JspString.HSC_MARKS_FIELD);
            if (hscMarks != null && !hscMarks.isEmpty()) {
                company.setHscmarks(Float.parseFloat(hscMarks));
            }
            String mcaMarks = request.getParameter(JspString.MCA_MARKS_FIELD);
            if (mcaMarks != null && !mcaMarks.isEmpty()) {
                company.setMcamarks(Float.parseFloat(mcaMarks));
            }

            JSONParser jsonParser = new JSONParser();
            JSONArray skillJsonArray = (JSONArray) jsonParser.parse(request.getParameter(JspString.SKILL_SELECT_FIELD));
            ListIterator iterator = skillJsonArray.listIterator();
            Set skillSet = new HashSet();
            while (iterator.hasNext()) {
                long o = Long.parseLong((String) iterator.next());
                Skill skill = new Skill();
                skill.setId(o);
                skillSet.add(skill);
            }
            company.setSkills(skillSet);
            log.error("SAVECOMAP-59: Company Name= " + company.getName());
            CompanyDAO companyDAO = new CompanyDAO();
            companyDAO.save(company);
            log.error("SAVECOMP-62: Company = " + company.getName() + " saved to database");
            object.put(JsonPropertyString.SUCCESS, "Company : " + company.getName() + " saved to database");

        } catch (Exception e) {
            log.error("Error Occurred: " + e.getMessage());
            log.error("SAVECOMP-66:Error Occurred: " + e.getMessage());
            object.put(errLabel, e.getMessage());
        } finally {
            out.print(object);
            log.error("SAVECOMP-71:flushing output"
                    + (object.get(JsonPropertyString.SUCCESS) != null ?
                    object.get(JsonPropertyString.SUCCESS) :
                    object.get(JsonPropertyString.ERROR)));
            out.flush();
        }
    }
%>