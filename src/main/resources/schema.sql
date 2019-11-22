DROP TABLE IF EXISTS kpi.legal_document CASCADE;
DROP TABLE IF EXISTS kpi.division CASCADE;
DROP TABLE IF EXISTS kpi.employee CASCADE;
DROP TABLE IF EXISTS kpi.authority CASCADE;
DROP TABLE IF EXISTS kpi.goal CASCADE;
DROP TABLE IF EXISTS kpi.division_employees CASCADE;
DROP TABLE IF EXISTS kpi.division_child_division CASCADE;
DROP TABLE IF EXISTS kpi.employee_child_employees CASCADE;
DROP TABLE IF EXISTS kpi.authority_divisions CASCADE;
DROP TABLE IF EXISTS kpi.division_goals CASCADE;
DROP TABLE IF EXISTS authority_child_authorities CASCADE;
DROP SEQUENCE IF EXISTS kpi.global_seq;

CREATE SEQUENCE kpi.global_seq START 100000;

CREATE TABLE kpi.division
(
    id                      INTEGER PRIMARY KEY DEFAULT nextval('kpi.global_seq'),
    name                    VARCHAR                              ,
    top_level               BOOLEAN                              ,
    chief_employee_id       INTEGER
);

CREATE TABLE kpi.legal_document
(
    id                      INTEGER PRIMARY KEY DEFAULT nextval('kpi.global_seq'),
    name                    VARCHAR                         ,
    filename                VARCHAR                         ,
    division_id             INTEGER                 NOT NULL,
    UNIQUE(division_id)                                     ,
    FOREIGN KEY (division_id) REFERENCES kpi.division (id) ON DELETE CASCADE
);

CREATE TABLE kpi.division_child_division
(
    division_id              INTEGER                      ,
    child_division_id        INTEGER                      ,
    FOREIGN KEY (division_id) REFERENCES kpi.division (id) ON DELETE CASCADE,
    FOREIGN KEY (child_division_id) REFERENCES kpi.division (id) ON DELETE CASCADE
);

CREATE TABLE kpi.employee
(
    id                      INTEGER PRIMARY KEY DEFAULT nextval('kpi.global_seq'),
    firstname               VARCHAR                               ,
    lastname                VARCHAR                               ,
    patronym                VARCHAR                               ,
    position                VARCHAR                               ,
    email                   VARCHAR                               ,
    phone                   VARCHAR
);

CREATE TABLE kpi.division_employees
(
    division_id              INTEGER                    ,
    employee_id             INTEGER                     ,
    FOREIGN KEY (division_id) REFERENCES kpi.division (id) ON DELETE CASCADE,
    FOREIGN KEY (employee_id) REFERENCES kpi.employee (id) ON DELETE CASCADE
);

CREATE TABLE kpi.employee_child_employees
(
    employee_id                  INTEGER                   ,
    child_employee_id            INTEGER                 ,
    FOREIGN KEY (employee_id) REFERENCES kpi.employee (id) ON DELETE CASCADE,
    FOREIGN KEY (child_employee_id) REFERENCES kpi.employee (id) ON DELETE CASCADE
);

CREATE TABLE kpi.goal
(
    id                      INTEGER PRIMARY KEY DEFAULT nextval('kpi.global_seq'),
    name                    VARCHAR                              ,
    description             VARCHAR                              ,
    create_date             DATE                                  ,
    execution_date          DATE                                  ,
    control_date            DATE
);

CREATE TABLE kpi.division_goals
(
    goal_id                 INTEGER                           ,
    division_id             INTEGER                           ,
    FOREIGN KEY (goal_id) REFERENCES kpi.goal (id) ON DELETE CASCADE,
    FOREIGN KEY (division_id) REFERENCES kpi.division (id) ON DELETE CASCADE
);

CREATE TABLE kpi.authority
(
    id                      INTEGER PRIMARY KEY DEFAULT nextval('kpi.global_seq'),
    name                    VARCHAR                                     ,
    top_level               BOOLEAN
);

CREATE TABLE kpi.authority_child_authorities
(
    authority_id                  INTEGER                    ,
    child_authority_id            INTEGER                    ,
    FOREIGN KEY (authority_id) REFERENCES kpi.authority (id) ON DELETE CASCADE,
    FOREIGN KEY (child_authority_id) REFERENCES kpi.authority (id) ON DELETE CASCADE
);

CREATE TABLE kpi.authority_divisions
(
    authority_id               INTEGER                           ,
    division_id                INTEGER                           ,
    FOREIGN KEY (authority_id) REFERENCES kpi.authority (id) ON DELETE CASCADE,
    FOREIGN KEY (division_id) REFERENCES kpi.division (id) ON DELETE CASCADE
);