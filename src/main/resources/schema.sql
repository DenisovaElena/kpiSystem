DROP TABLE IF EXISTS kpi.legal_document CASCADE;
DROP TABLE IF EXISTS kpi.division CASCADE;
DROP TABLE IF EXISTS kpi.employee CASCADE;
DROP TABLE IF EXISTS kpi.authority CASCADE;
DROP TABLE IF EXISTS kpi.goal CASCADE;
DROP TABLE IF EXISTS kpi.division_employee CASCADE;
DROP TABLE IF EXISTS kpi.division_child_division CASCADE;
DROP TABLE IF EXISTS kpi.employee_child_employee CASCADE;
DROP TABLE IF EXISTS kpi.authority_division CASCADE;
DROP TABLE IF EXISTS kpi.division_goal CASCADE;
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
    division_id              INTEGER                      NOT NULL,
    child_division_id        INTEGER                      NOT NULL,
    FOREIGN KEY (division_id) REFERENCES kpi.division (id) ON DELETE CASCADE,
    FOREIGN KEY (child_division_id) REFERENCES kpi.division (id) ON DELETE CASCADE
);

CREATE TABLE kpi.employee
(
    id                      INTEGER PRIMARY KEY DEFAULT nextval('kpi.global_seq'),
    division_id             INTEGER                               ,
    firstname               VARCHAR                               ,
    lastname                VARCHAR                               ,
    patronym                VARCHAR                               ,
    position                VARCHAR                               ,
    email                   VARCHAR                               ,
    phone                   VARCHAR                               ,
    FOREIGN KEY (division_id) REFERENCES kpi.division (id) ON DELETE CASCADE
);

CREATE TABLE kpi.division_employee
(
    division_id              INTEGER                     NOT NULL,
    employee_id             INTEGER                     NOT NULL,
    FOREIGN KEY (division_id) REFERENCES kpi.division (id) ON DELETE CASCADE,
    FOREIGN KEY (employee_id) REFERENCES kpi.employee (id) ON DELETE CASCADE
);

CREATE TABLE kpi.employee_child_employee
(
    employee_id                  INTEGER        NOT NULL           ,
    child_employee_id            INTEGER        NOT NULL           ,
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

CREATE TABLE kpi.division_goal
(
    goal_id                 INTEGER             NOT NULL              ,
    division_id                INTEGER             NOT NULL              ,
    FOREIGN KEY (goal_id) REFERENCES kpi.goal (id) ON DELETE CASCADE,
    FOREIGN KEY (division_id) REFERENCES kpi.division (id) ON DELETE CASCADE
);

CREATE TABLE kpi.authority
(
    id                      INTEGER PRIMARY KEY DEFAULT nextval('kpi.global_seq'),
    name                    VARCHAR
);

CREATE TABLE kpi.authority_division
(
    authority_id               INTEGER             NOT NULL              ,
    division_id                INTEGER             NOT NULL              ,
    FOREIGN KEY (authority_id) REFERENCES kpi.authority (id) ON DELETE CASCADE,
    FOREIGN KEY (division_id) REFERENCES kpi.division (id) ON DELETE CASCADE
);