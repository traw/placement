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
            logger.error(entry.getKey() + " : " + param);
        }
    }

    jsonQuery = cleanJsonQueryObject(jsonQuery);

    if (object.equals(JspString.OBJ_STUD)) {
        if (action.equals(JspString.ACTION_GET_COMP)) {
            getCompaniesForStudent(request, response, out, action);
        } else {
            handleSearchStudent(request, response, out, jsonQuery);
        }
    } else if (object.equals(JspString.OBJ_COMP)) {
        if (action.equals(JspString.ACTION_GET_STUD)) {
            getStudentsForCompany(request, response, out, action);
        } else {
            handleSearchCompany(request, response, out, jsonQuery);
        }
    } else if (object.equals(JspString.OBJ_SKILL)) {
        handleSearchSkill(request, response, out, jsonQuery);
    }
%>
<%!

    private void getStudentsForCompany(HttpServletRequest request, HttpServletResponse response, JspWriter out, String action) {
        Logger logger = LoggerFactory.getLogger(this.getClass());
        JSONObject responseJsonObject = new JSONObject();
        try {
            String compID = request.getParameter(JspString.ID_FIELD);
            Long id = Long.parseLong(compID);
            if (compID == null || compID.isEmpty()) {
                throw new RuntimeException("No ID is provided");
            }
            CompanyDAO dao = new CompanyDAO();
            List<Student> students = dao.findStudents(id);
            if (students.size() == 0) {
                responseJsonObject.put(JsonPropertyString.SUCCESS, "No company found");
            } else {
                initStudentList(students, responseJsonObject);
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

    private void getCompaniesForStudent(HttpServletRequest request, HttpServletResponse response, JspWriter out, String action) {
        Logger logger = LoggerFactory.getLogger(this.getClass());
        JSONObject responseJsonObject = new JSONObject();
        try {
            String studID = request.getParameter(JspString.ID_FIELD);
            Long id = Long.parseLong(studID);
            if (studID == null || studID.isEmpty()) {
                throw new RuntimeException("No ID is provided");
            }
            StudentDAO dao = new StudentDAO();
            List<Company> companies = dao.findCompanies(id);
            if (companies.size() == 0) {
                responseJsonObject.put(JsonPropertyString.SUCCESS, "No company found");
            } else {
                initCompanyList(companies, responseJsonObject);
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

    private void handleSearchSkill(HttpServletRequest request, HttpServletResponse response, JspWriter out, JSONObject jsonQuery) {
        Logger logger = LoggerFactory.getLogger(this.getClass());
        JSONObject responseJsonObject = new JSONObject();
        try {
            SkillDAO skillDAO = new SkillDAO();
            logger.error("searchAction:46 -> " + jsonQuery.toJSONString());
            List<Skill> skillList = skillDAO.findByJSONQuery(jsonQuery);
            if (skillList.size() > 0) {
                JSONArray propertyKeysArray = getSkillKeies();
                responseJsonObject.put(JsonPropertyString.PARAM_KEYS, propertyKeysArray);

                JSONArray skillJsonArray = new JSONArray();
                for (Skill skill1 : skillList) {
                    JSONArray valueArray = assignSkillToJSONArray(skill1);
                    skillJsonArray.add(valueArray);
                }
                responseJsonObject.put(JsonPropertyString.PARAM_OBJ, skillJsonArray);
            } else {
                responseJsonObject.put(JsonPropertyString.ERROR, "No Skill Found");
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

    private void handleSearchCompany(HttpServletRequest request, HttpServletResponse response, JspWriter out, JSONObject jsonQuery) {

        Logger logger = LoggerFactory.getLogger(this.getClass());
        JSONObject responseJsonObject = new JSONObject();
        try {
            CompanyDAO companyDAO = new CompanyDAO();
            logger.error("searchAction:46 -> " + jsonQuery.toJSONString());
            List<Company> companyList = companyDAO.findByJSONQuery(jsonQuery);
            if (companyList.size() > 0) {
                initCompanyList(companyList, responseJsonObject);
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

            List<Student> studentList = studentDao.findByJSONQuery(jsonQuery);
            if (studentList.size() > 0) {
                initStudentList(studentList, responseJsonObject);
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

    JSONArray getSkillKeies() {
        JSONArray propertyKeysArray = new JSONArray();
        propertyKeysArray.add(JspString.ID_FIELD);
        propertyKeysArray.add(JspString.NAME_FIELD);
        return propertyKeysArray;
    }

    JSONArray assignSkillToJSONArray(Skill skill) {
        JSONArray valueArray = new JSONArray();
        valueArray.add(skill.getId());
        valueArray.add(skill.getName());
        return valueArray;
    }

    JSONArray getStudentKeies() {
        JSONArray propertyKeysArray = new JSONArray();
        propertyKeysArray.add(JspString.ID_FIELD);
        propertyKeysArray.add(JspString.NAME_FIELD);
        propertyKeysArray.add(JspString.EMAIL_ID_FIELD);
        propertyKeysArray.add(JspString.IS_PLACED_FIELD);
        propertyKeysArray.add(JspString.SSC_MARKS_FIELD);
        propertyKeysArray.add(JspString.HSC_MARKS_FIELD);
        propertyKeysArray.add(JspString.MCA_MARKS_FIELD);
        propertyKeysArray.add(JspString.SKILL_SELECT_FIELD);
        return propertyKeysArray;
    }

    JSONArray assignStudentToJSONArray(Student student) {
        JSONArray valueArray = new JSONArray();
        valueArray.add(student.getId());
        valueArray.add(student.getName());
        valueArray.add(student.getEmailid());
        valueArray.add(student.getPlaced());
        valueArray.add(student.getSscmarks());
        valueArray.add(student.getHscmarks());
        valueArray.add(student.getMcamarks());
        return valueArray;
    }

    JSONArray getCompanyKeies() {
        JSONArray propertyKeysArray = new JSONArray();
        propertyKeysArray.add(JspString.ID_FIELD);
        propertyKeysArray.add(JspString.NAME_FIELD);
        propertyKeysArray.add(JspString.SSC_MARKS_FIELD);
        propertyKeysArray.add(JspString.HSC_MARKS_FIELD);
        propertyKeysArray.add(JspString.MCA_MARKS_FIELD);
        propertyKeysArray.add(JspString.DESCRIPTION_FIELD);
        propertyKeysArray.add(JspString.SKILL_SELECT_FIELD);
        return propertyKeysArray;
    }

    JSONArray assignCompanyToJSONArray(Company company) {
        JSONArray valueArray = new JSONArray();
        valueArray.add(company.getId());
        valueArray.add(company.getName());
        valueArray.add(company.getSscmarks());
        valueArray.add(company.getHscmarks());
        valueArray.add(company.getMcamarks());
        valueArray.add(company.getDescription());
        return valueArray;
    }


    private JSONObject cleanJsonQueryObject(JSONObject jsonQuery) {

        if (jsonQuery.get(JspString.VALIDATED_FIELD) != null) {
            jsonQuery.remove(JspString.VALIDATED_FIELD);
        }
        if (jsonQuery.get(JsonPropertyString.PARAM_OBJ) != null) {
            jsonQuery.remove(JsonPropertyString.PARAM_OBJ);
        }
        if (jsonQuery.get(JsonPropertyString.PARAM_ACTION) != null) {
            jsonQuery.remove(JsonPropertyString.PARAM_ACTION);
        }
        return jsonQuery;
    }

    private void initCompanyList(List<Company> companyList, JSONObject responseJsonObject) {
        JSONArray propertyKeysArray = getCompanyKeies();
        responseJsonObject.put(JsonPropertyString.PARAM_KEYS, propertyKeysArray);

        JSONArray companyJsonArray = new JSONArray();
        for (Company company : companyList) {
            JSONArray valueArray = assignCompanyToJSONArray(company);
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
            companyJsonArray.add(valueArray);
        }
        responseJsonObject.put(JsonPropertyString.PARAM_OBJ, companyJsonArray);
        responseJsonObject.put(JsonPropertyString.PARAM_TARGET, JspString.OBJ_COMP);
    }


    private void initStudentList(List<Student> studentList, JSONObject responseJsonObject) {
        JSONArray propertyKeysArray = getStudentKeies();
        responseJsonObject.put(JsonPropertyString.PARAM_KEYS, propertyKeysArray);

        JSONArray studentsJsonArray = new JSONArray();
        for (Student student : studentList) {
            JSONArray valueArray = assignStudentToJSONArray(student);
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
        responseJsonObject.put(JsonPropertyString.PARAM_TARGET, JspString.OBJ_STUD);
    }

%>