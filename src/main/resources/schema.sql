DROP TABLE IF EXISTS kpi.legal_documents CASCADE;
DROP TABLE IF EXISTS kpi.division CASCADE;
DROP TABLE IF EXISTS kpi.employee CASCADE;
DROP TABLE IF EXISTS kpi.authority CASCADE;
DROP TABLE IF EXISTS kpi.goal CASCADE;
DROP TABLE IF EXISTS kpi.divisions_employees CASCADE;

CREATE SEQUENCE kpi.global_seq START 100000;


CREATE TABLE kpi.legal_documents
(
  id                      INTEGER PRIMARY KEY DEFAULT nextval('kpi.global_seq'),
  id_parent               INTEGER                 NOT NULL,
  division_id             INTEGER                 NOT NULL,
  name                    VARCHAR                         ,
  filename                VARCHAR                         ,
  FOREIGN KEY (division_id) REFERENCES kpi.legal_documents (id) ON DELETE CASCADE
);

CREATE TABLE kpi.division
(
  id                      INTEGER PRIMARY KEY DEFAULT nextval('kpi.global_seq'),
  id_parent               INTEGER                      NOT NULL,
  name                    VARCHAR                              ,
  FOREIGN KEY (employee_id) REFERENCES kpi.employee (id) ON DELETE CASCADE,
  FOREIGN KEY (division_id) REFERENCES kpi.division (id) ON DELETE CASCADE
);

CREATE TABLE kpi.divisions_employees
(
  id_division              INTEGER                     NOT NULL,
  id_employee              INTEGER                     NOT NULL,
  FOREIGN KEY (division_id) REFERENCES kpi.division (id) ON DELETE CASCADE,
  FOREIGN KEY (distribution_departments_id) REFERENCES esrd.department (id) ON DELETE CASCADE
);

CREATE TABLE kpi.employee
(
  id                      INTEGER PRIMARY KEY DEFAULT nextval('kpi.global_seq'),
  id_parent               INTEGER                      NOT NULL,
  id_division             INTEGER                              ,
  firstname               VARCHAR                              ,
  lastname                VARCHAR                               ,
  patronym                VARCHAR                               ,
  position                VARCHAR                               ,
  email                   VARCHAR                               ,
  phone                   VARCHAR                               ,
  FOREIGN KEY (doctype_id) REFERENCES esrd.doctype (id) ON DELETE CASCADE,
  FOREIGN KEY (initial_user_id) REFERENCES esrd.users (id) ON DELETE CASCADE
);

CREATE TABLE kpi.goal
(
  id                      INTEGER PRIMARY KEY DEFAULT nextval('kpi.global_seq'),
  id_parent               INTEGER                      NOT NULL,
  name                    VARCHAR                              ,
  description             VARCHAR                               ,
  create_date             TIMESTAMP                             ,
  execution_date          TIMESTAMP                             ,
  control_date            TIMESTAMP                              ,
  FOREIGN KEY (goal_id) REFERENCES esrd.goal (id) ON DELETE CASCADE,
  FOREIGN KEY (division_id) REFERENCES esrd.division (id) ON DELETE CASCADE
);

CREATE TABLE kpi.authority
(
  id                      INTEGER PRIMARY KEY DEFAULT nextval('kpi.global_seq'),
  name                    VARCHAR                              ,
  FOREIGN KEY (doctype_id) REFERENCES esrd.doctype (id) ON DELETE CASCADE,
  FOREIGN KEY (initial_user_id) REFERENCES esrd.users (id) ON DELETE CASCADE
);