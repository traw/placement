<%@ page import="org.in.placementv2.model.Skill" %>
<%@ page import="org.in.placementv2.model.SkillDAO" %>
<%@ page import="org.in.placementv2.util.JsonPropertyString" %>
<%@ page import="org.in.placementv2.util.JspString" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.slf4j.Logger" %>
<%@ page import="org.slf4j.LoggerFactory" %>
<%@ page import="java.io.IOException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    public void saveSkill(HttpServletRequest request, HttpServletResponse response, JspWriter out) throws IOException {
        Logger log = LoggerFactory.getLogger(this.getClass());
        String errLabel = JsonPropertyString.ERROR;
        JSONObject object = new JSONObject();
        try {
            Skill skill = new Skill();

            String skillId = request.getParameter(JspString.ID_FIELD);
            if (skillId != null && !skillId.isEmpty()) {
                skill.setId(Long.parseLong(skillId));
            }
            String name = request.getParameter(JspString.NAME_FIELD);
            if (name != null && !name.isEmpty()) {
                skill.setName(name);
            }

            SkillDAO skillDAO = new SkillDAO();
            skillDAO.save(skill);
            object.put(JsonPropertyString.SUCCESS, "Skill : " + skill.getName() + " saved to database");

        } catch (Exception e) {
            log.error("Error Occurred: " + e.getMessage());
            object.put(errLabel, e.getMessage());
        } finally {
            out.print(object);
            out.flush();
        }
    }
%>