<%@include file="inc/taglibs.jsp" %>
<%@ page import="org.in.placementv2.util.JsonPropertyString" %>
<%@ page import="org.in.placementv2.util.JspString" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.slf4j.Logger" %>
<%@ page import="org.slf4j.LoggerFactory" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="org.in.placementv2.model.*" %>
<%@ page import="java.io.IOException" %>


<%!
    public void handleSearchCompany(HttpServletRequest request, HttpServletResponse response, JspWriter out) {
        Logger logger = LoggerFactory.getLogger(this.getClass());
        String errLabel = JsonPropertyString.ERROR, errMsg;

        JSONObject responseJsonObject = new JSONObject();
        try {
            JSONObject jsonQuery = new JSONObject();
            Map<String, String[]> map = request.getParameterMap();
            for (Map.Entry<String, String[]> entry : map.entrySet()) {
                for (String param : entry.getValue()) {
                    jsonQuery.put(entry.getKey(), param);
                }
            }
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
                responseJsonObject.put(JsonPropertyString.PARAM_COMP, studentsJsonArray);
            } else {
                responseJsonObject.put(errLabel, "No Student Found");
            }
        } catch (Exception e) {
            responseJsonObject.put(errLabel, "Exception Occurred: " + e.getMessage());
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
