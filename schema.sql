CREATE TABLE IF NOT EXISTS student
(
 id bigserial PRIMARY KEY, 
 name varchar(30) NOT NULL,
 emailid varchar(30) NOT NULL,
 password varchar(30) NOT NULL,
 placed boolean NOT NULL,
 sscmarks real NOT NULL,
 hscmarks real NOT NULL,
 mcamarks real NOT NULL
);



CREATE SEQUENCE skill_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;

CREATE TABLE IF NOT EXIST skill
(
  id bigserial NOT NULL,
  name varchar(30),
  PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXIST student_skill
(
  student_id long,
  skill_id  long,
  FOREIGN KEY (student_id) REFERENCES student(id) ON DELETE CASCADE,
  FOREIGN KEY (skill_id) REFERENCES skill(id) ON DELETE CASCADE,
  PRIMARY KEY (student_id, skill_id) 
);

CREATE TABLE IF NOT EXIST company
(
 id long NOT NULL AUTO_INCREMENT,
 name varchar(30) UNIQUE,
 description varchar(200),
 PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXIST company_criteria
(
  company_id long NOT NULL,
  sscmark  float,
  hscmark  float,
  mcamark  float,
  FOREIGN KEY (company_id) REFERENCES company(id) ON DELETE CASCADE,
  PRIMARY KEY (company_id)
);


CREATE TABLE IF NOT EXIST company_skill
(
  company_id long,
  skill_id  long,
  FOREIGN KEY (company_id) REFERENCES company(id) ON DELETE CASCADE,
  FOREIGN KEY (skill_id) REFERENCES skill(id) ON DELETE CASCADE,
  PRIMARY KEY (company_id, skill_id)
);

CREATE TABLE IF NOT EXIST user
(
  username varchar(30) NOT NULL,
  password varchar(30) NOT NULL,
  PRIMARY KEY(username)
);
