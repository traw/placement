CREATE TABLE comapny_criteria
(
    sscmarks REAL,
    hscmarks REAL,
    mcamarks REAL,
    company_id BIGINT PRIMARY KEY NOT NULL
);
CREATE TABLE company
(
    id BIGINT PRIMARY KEY NOT NULL,
    name _VARCHAR,
    description _VARCHAR
);
CREATE TABLE company_id_seq
(
    sequence_name VARCHAR NOT NULL,
    last_value BIGINT NOT NULL,
    start_value BIGINT NOT NULL,
    increment_by BIGINT NOT NULL,
    max_value BIGINT NOT NULL,
    min_value BIGINT NOT NULL,
    cache_value BIGINT NOT NULL,
    log_cnt BIGINT NOT NULL,
    is_cycled BOOL NOT NULL,
    is_called BOOL NOT NULL
);
CREATE TABLE company_skill
(
    company_id BIGINT NOT NULL,
    skill_id BIGINT NOT NULL,
    PRIMARY KEY ( company_id, skill_id )
);
CREATE TABLE skill
(
    name _VARCHAR,
    id BIGINT PRIMARY KEY NOT NULL
);
CREATE TABLE skill_id_seq
(
    sequence_name VARCHAR NOT NULL,
    last_value BIGINT NOT NULL,
    start_value BIGINT NOT NULL,
    increment_by BIGINT NOT NULL,
    max_value BIGINT NOT NULL,
    min_value BIGINT NOT NULL,
    cache_value BIGINT NOT NULL,
    log_cnt BIGINT NOT NULL,
    is_cycled BOOL NOT NULL,
    is_called BOOL NOT NULL
);
CREATE TABLE student
(
    id BIGINT PRIMARY KEY NOT NULL,
    name VARCHAR(30) NOT NULL,
    emailid VARCHAR(30) NOT NULL,
    password VARCHAR(30) NOT NULL,
    placed BOOL NOT NULL,
    sscmarks REAL NOT NULL,
    hscmarks REAL NOT NULL,
    mcamarks REAL NOT NULL
);
CREATE TABLE student_id_seq
(
    sequence_name VARCHAR NOT NULL,
    last_value BIGINT NOT NULL,
    start_value BIGINT NOT NULL,
    increment_by BIGINT NOT NULL,
    max_value BIGINT NOT NULL,
    min_value BIGINT NOT NULL,
    cache_value BIGINT NOT NULL,
    log_cnt BIGINT NOT NULL,
    is_cycled BOOL NOT NULL,
    is_called BOOL NOT NULL
);
CREATE TABLE student_skill
(
    student_id BIGINT NOT NULL,
    skill_id BIGINT NOT NULL,
    PRIMARY KEY ( student_id, skill_id )
);
CREATE TABLE users
(
    username VARCHAR(30) PRIMARY KEY NOT NULL,
    password VARCHAR(30)
);
ALTER TABLE comapny_criteria ADD FOREIGN KEY ( company_id ) REFERENCES company ( id );
CREATE UNIQUE INDEX company_name_key ON company ( name );
ALTER TABLE company_skill ADD FOREIGN KEY ( company_id ) REFERENCES company ( id );
ALTER TABLE company_skill ADD FOREIGN KEY ( skill_id ) REFERENCES skill ( id );
CREATE UNIQUE INDEX skill_name_key ON skill ( name );
ALTER TABLE student_skill ADD FOREIGN KEY ( skill_id ) REFERENCES skill ( id );
ALTER TABLE student_skill ADD FOREIGN KEY ( student_id ) REFERENCES student ( id ) ON DELETE CASCADE;
