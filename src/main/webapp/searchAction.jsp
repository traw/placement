<%@ page import="org.slf4j.Logger" %>
<%@ page import="org.slf4j.LoggerFactory" %>
<%@ page import="org.in.placementv2.util.JsonPropertyString" %>
<%@ page import="org.in.placementv2.util.JspString" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="org.in.placementv2.model.*" %>
<%@ page import="java.io.IOException" %>

<%
    Logger logger = LoggerFactory.getLogger(this.getClass());
    String object = request.getParameter(JsonPropertyString.PARAM_OBJ);
    String action = request.getParameter(JsonPropertyString.PARAM_ACTION);

    JSONObject jsonQuery = new JSONObject();
    Map<String, String[]> map = request.getParameterMap();
    for (Map.Entry<String, String[]> entry : map.entrySet()) {
        for (String param : entry.getValue()) {
            jsonQuery.put(entry.getKey(), param);
        }
    }

    if (object.equals(JspString.OBJ_STUD)) {
        handleSearchStudent(request, response, out, jsonQuery);
    } else if (object.equals(JspString.OBJ_COMP)) {
        handleSearchCompany(request, response, out, jsonQuery);
    } else if (object.equals(JspString.OBJ_SKILL)) {
        handleSearchSkill(request, response, out, jsonQuery);
    }
%>
<%!
    private void handleSearchSkill(HttpServletRequest request, HttpServletResponse response, JspWriter out, JSONObject jsonQuery) {

    }

    private void handleSearchCompany(HttpServletRequest request, HttpServletResponse response, JspWriter out, JSONObject jsonQuery) {

        Logger logger = LoggerFactory.getLogger(this.getClass());
        JSONObject responseJsonObject = new JSONObject();
        try {
            CompanyDAO companyDAO = new CompanyDAO();

            List<Company> companyList = companyDAO.findCompanyForJSONQuery(jsonQuery);
            if (companyList.size() > 0) {
                JSONArray propertyKeysArray = new JSONArray();
                propertyKeysArray.add(JspString.ID_FIELD);
                propertyKeysArray.add(JspString.NAME_FIELD);
                propertyKeysArray.add(JspString.SSC_MARKS_FIELD);
                propertyKeysArray.add(JspString.HSC_MARKS_FIELD);
                propertyKeysArray.add(JspString.MCA_MARKS_FIELD);
                responseJsonObject.put(JsonPropertyString.PARAM_KEYS, propertyKeysArray);

                JSONArray studentsJsonArray = new JSONArray();
                for (Company company : companyList) {
                    JSONArray valueArray = new JSONArray();
                    valueArray.add(company.getId());
                    valueArray.add(company.getName());
                    valueArray.add(company.getSscmarks());
                    valueArray.add(company.getHscmarks());
                    valueArray.add(company.getMcamarks());

                    JSONArray skillArray = new JSONArray();
                    Iterator<Skill> skillIterator = company.getSkills().iterator();
                    while (skillIterator.hasNext()) {
                        JSONObject skillObject = new JSONObject();
                        Skill skill = skillIterator.next();
                        skillObject.put(JspString.ID_FIELD, skill.getId());
                        skillObject.put(JspString.NAME_FIELD, skill.getName());
                        skillArray.add(skillObject);
                    }

                    valueArray.add(skillArray);
                    studentsJsonArray.add(valueArray);
                }
                responseJsonObject.put(JsonPropertyString.PARAM_OBJ, studentsJsonArray);
            } else {
                responseJsonObject.put(JsonPropertyString.ERROR, "No Student Found");
            }
        } catch (Exception e) {
            responseJsonObject.put(JsonPropertyString.ERROR, "Exception Occurred: " + e.getMessage());
            e.printStackTrace();
        } finally {
            logger.error(responseJsonObject.toJSONString());
            try {
                out.print(responseJsonObject);
                out.flush();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void handleSearchStudent(HttpServletRequest request, HttpServletResponse response, JspWriter out, JSONObject jsonQuery) {
        Logger logger = LoggerFactory.getLogger(this.getClass());
        JSONObject responseJsonObject = new JSONObject();
        try {
            StudentDAO studentDao = new StudentDAO();

            List<Student> studentList = studentDao.findStudentForJSONQuery(jsonQuery);
            if (studentList.size() > 0) {
                JSONArray propertyKeysArray = new JSONArray();
                propertyKeysArray.add(JspString.ID_FIELD);
                propertyKeysArray.add(JspString.NAME_FIELD);
                propertyKeysArray.add(JspString.EMAIL_ID_FIELD);
                propertyKeysArray.add(JspString.IS_PLACED_FIELD);
                propertyKeysArray.add(JspString.SSC_MARKS_FIELD);
                propertyKeysArray.add(JspString.HSC_MARKS_FIELD);
                propertyKeysArray.add(JspString.MCA_MARKS_FIELD);
                responseJsonObject.put(JsonPropertyString.PARAM_KEYS, propertyKeysArray);

                JSONArray studentsJsonArray = new JSONArray();
                for (Student student : studentList) {
                    JSONArray valueArray = new JSONArray();
                    valueArray.add(student.getId());
                    valueArray.add(student.getName());
                    valueArray.add(student.getEmailid());
                    valueArray.add(student.getPlaced());
                    valueArray.add(student.getSscmarks());
                    valueArray.add(student.getHscmarks());
                    valueArray.add(student.getMcamarks());

                    JSONArray skillArray = new JSONArray();
                    Iterator<Skill> skillIterator = student.getSkills().iterator();
                    while (skillIterator.hasNext()) {
                        JSONObject skillObject = new JSONObject();
                        Skill skill = skillIterator.next();
                        skillObject.put(JspString.ID_FIELD, skill.getId());
                        skillObject.put(JspString.NAME_FIELD, skill.getName());
                        skillArray.add(skillObject);
                    }

                    valueArray.add(skillArray);
                    studentsJsonArray.add(valueArray);
                }
                responseJsonObject.put(JsonPropertyString.PARAM_OBJ, studentsJsonArray);
            } else {
                responseJsonObject.put(JsonPropertyString.ERROR, "No Student Found");
            }
        } catch (Exception e) {
            responseJsonObject.put(JsonPropertyString.ERROR, "Exception Occurred: " + e.getMessage());
            e.printStackTrace();
        } finally {
            logger.error(responseJsonObject.toJSONString());
            try {
                out.print(responseJsonObject);
                out.flush();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }
%>