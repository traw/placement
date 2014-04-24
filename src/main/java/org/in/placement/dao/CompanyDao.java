package org.in.placement.dao;

/**
 * Created by traw on 16/04/14.
 */

import org.in.placement.model.Company;
import org.in.placement.model.Criteria;
import org.in.placement.model.Skill;
import org.json.simple.JSONObject;

import java.beans.PropertyVetoException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * CREATE TABLE IF NOT EXIST company
 * (
 *   id long NOT NULL AUTO_INCREMENT,
 *   name varchar(30) UNIQUE,
 *   description varchar(200),
 *   PRIMARY KEY(id)
 * );
 *
 * CREATE TABLE IF NOT EXIST company_criteria
 * (
 *   company_id long NOT NULL,
 *   sscmark  float,
 *   hscmark  float,
 *   mcamark  float,
 *   FOREIGN KEY (company_id) REFERENCES company(id) ON DELETE CASCADE,
 *   PRIMARY KEY (company_id)
 * );
 *
 * CREATE TABLE IF NOT EXIST company_skill
 * (
 *   company_id long,
 *   skill_id  long,
 *   FOREIGN KEY (company_id) REFERENCES company(id) ON DELETE CASCADE,
 *   FOREIGN KEY (skill_id) REFERENCES skill(id) ON DELETE CASCADE,
 *   PRIMARY KEY (company_id, skill_id)
 * );
 * */
public interface CompanyDao {
    public List<Company> getCompanies();
    public List<Company> getCompanies(JSONObject jsonQuery);

    public List<Skill> getCompanySkills(long companyID) throws PropertyVetoException, SQLException;
    public List<Skill> getCompanySkills(Company company) throws PropertyVetoException, SQLException;


}
