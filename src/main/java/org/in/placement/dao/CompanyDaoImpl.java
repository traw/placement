package org.in.placement.dao;

import org.in.placement.model.Company;
import org.in.placement.model.Criteria;
import org.in.placement.model.Skill;
import org.in.placement.util.DataSource;
import org.in.placement.util.SQLDilect;
import org.in.placement.util.TableString;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.beans.PropertyVetoException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by traw on 16/04/14.
 */
public class CompanyDaoImpl implements CompanyDao, TableString, SQLDilect {
    private Logger log = LoggerFactory.getLogger(CompanyDaoImpl.class);
    private static CompanyDaoImpl ourInstance = null;

    public static CompanyDaoImpl getInstance() {
        if (ourInstance == null){
           ourInstance  = new CompanyDaoImpl();
        }
        return ourInstance;
    }

    private CompanyDaoImpl() {
    }

    @Override
    public List<Company> getCompanies() {
        return null;
    }

    @Override
    public List<Company> getCompanies(JSONObject jsonQuery) {
        return null;
    }

    @Override
    public List<Skill> getCompanySkills(long companyID) throws PropertyVetoException, SQLException {
        List<Skill> skills = new ArrayList<Skill>();
        String skillQuery = SELECT +"*" +FROM + SKILL_TABLE + WHERE + SKILL_ID_COL
                +"IN (" + SELECT + COMPANYSKILL_SKILL_ID_COL + FROM
                + COMPANY_SKILL_TABLE + WHERE + COMPANYSKILL_COMPANY_ID_COL
                + " = ?";

        DataSource dataSource = DataSource.getInstance();
        try (Connection connection = dataSource.getConnection()) {
            try (PreparedStatement statement = connection
                    .prepareStatement(skillQuery)) {
                statement.setLong(1, companyID);
                try (ResultSet res = statement.executeQuery()) {
                    while (res.next()) {
                        Skill skill = new Skill(res.getLong(SKILL_ID_COL),
                                res.getString(SKILL_NAME_COL));
                        skills.add(skill);
                    }
                }
            } catch (SQLException e) {
                log.error(e.getMessage(), e);
                throw e;
            }
        } catch (SQLException e) {
            log.error(e.getMessage(), e);
            throw e;
        }
        return skills;
    }

    @Override
    public List<Skill> getCompanySkills(Company company) throws PropertyVetoException, SQLException {
        return getCompanySkills(company.getId());
    }
}
