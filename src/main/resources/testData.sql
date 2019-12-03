--Test data
INSERT INTO kpi.division(id, name, top_level, chief_employee_id) VALUES (1, 'Управление ценовой и тарифной политики',true, 13);
INSERT INTO kpi.division(id, name, top_level, chief_employee_id) VALUES (2, 'Сводное управление бюджетных инвестиций', true, 14);
INSERT INTO kpi.division(id, name, top_level, chief_employee_id) VALUES (3, 'Управление бюджетных инвестиций дорожно-мостового, жилищного строительства и объектов инженерии',true, 15);
INSERT INTO kpi.division(id, name, top_level, chief_employee_id) VALUES (4, 'Управление регулирования тарифов на услуги транспортных организаций', true, 16);
INSERT INTO kpi.division(id, name, top_level, chief_employee_id) VALUES (5, 'Управление бюджетной и налоговой политики', true, 17);
INSERT INTO kpi.division(id, name, top_level, chief_employee_id) VALUES (6, 'Управление миграционной политики', true, 18);
INSERT INTO kpi.division(id, name, top_level, chief_employee_id) VALUES (7, 'Отдел экономических нормативов и начальных (максимальных) цен контрактов', false, 19);
INSERT INTO kpi.division(id, name, top_level, chief_employee_id) VALUES (8, 'Отдел  цен и тарифной политики в городском хозяйстве', false, 20);
INSERT INTO kpi.division(id, name, top_level, chief_employee_id) VALUES (9, 'Отдел развития инженерии', false, 21);
INSERT INTO kpi.division(id, name, top_level, chief_employee_id) VALUES (10, 'Отдел экономики социальной защиты и прочих отраслей', false, 22);
INSERT INTO kpi.division(id, name, top_level, chief_employee_id) VALUES (11, 'Отдел строительства объектов социальной сферы', false, 23);
INSERT INTO kpi.division(id, name, top_level, chief_employee_id) VALUES (12, 'Отдел экономики образования и культуры/ГБУ ЦНД', false, 24);

INSERT INTO kpi.employee(id, name, lastname, firstname, patronym, position, email, phone) VALUES (53, 'admin',
                                                                                                  'Махров',
                                                                                                  'Станислав',
                                                                                                  'Станиславович',
                                                                                                  'Начальник ' ||
                                                                                                  'Отдела анализа',
                                                                                                  'mak@mail.ru',
                                                                                                  '15555');
INSERT  INTO kpi.employee(id, name, lastname, firstname, patronym, position, email, phone) VALUES (13, 'user1', 'Иванов',
                                                                                                   'Иван',
                                                                                                   'Иванович', 'Начальник Управления ценовой и тарифной политики','iv@mail.ru', '15555');
INSERT  INTO kpi.employee(id, name, lastname, firstname, patronym, position, email, phone) VALUES (14, 'user2',
                                                                                                   'Петров',
                                                                                                   'Иван',
                                                                                                   'Иванович', 'Начальник Сводного управления бюджетных инвестиций', 'iv@mail.ru', '15555');
INSERT  INTO kpi.employee(id, name, lastname, firstname, patronym, position, email, phone) VALUES (15, 'user3',
                                                                                                   'Сидоров',
                                                                                                   'Иван','Иванович', 'Начальник Управления бюджетных инвестиций дорожно-мостового, жилищного строительства и объектов инженерии', 'iv@mail.ru', '15555');
INSERT  INTO kpi.employee(id, name, lastname, firstname, patronym, position, email, phone) VALUES (16,  'user4',
                                                                                                   'Ларькова',
                                                                                                   'Алиса','Петровна', 'Начальник Управления регулирования тарифов на услуги транспортных организаций', 'iv@mail.ru', '15555');
INSERT  INTO kpi.employee(id, name, lastname, firstname, patronym, position, email, phone) VALUES (17,  'user5',
                                                                                                   'Мирзоев',
                                                                                                   'Ибрагим','Исмаилович', 'Начальник Управления бюджетной и налоговой политики', 'iv@mail.ru', '15555');
INSERT  INTO kpi.employee(id, name, lastname, firstname, patronym, position, email, phone) VALUES (18, 'user6',
                                                                                                   'Насраилова','Фируза','Алмазона', 'Начальник Управления миграционной политики','iv@mail.ru', '15555');

INSERT  INTO kpi.employee(id, name, lastname, firstname, patronym, position, email, phone) VALUES (19, 'user7',
                                                                                                   'Очкова',
                                                                                                   'Оксана',
                                                                                                   'Евгеньевна', 'Начальник Отдела экономических нормативов и начальных (максимальных) цен контрактов', 'iv@mail.ru', '15555');
INSERT  INTO kpi.employee(id, name, lastname, firstname, patronym, position, email, phone) VALUES (20, 'user8',
                                                                                                   'Правдивый','Андрей','Иванович', 'Начальник Отдела цен и тарифной политики в городском хозяйстве', 'iv@mail.ru', '15555');
INSERT  INTO kpi.employee(id, name,  lastname, firstname, patronym, position, email, phone) VALUES (21, 'user9',
                                                                                                    'Субботкина','Лариса','Петровна', 'Начальник Отдела развития инженерии','iv@mail.ru', '15555');
INSERT  INTO kpi.employee(id, name, lastname, firstname, patronym, position, email, phone) VALUES (22, 'user10',
                                                                                                   'Криворучко','Виктория','Валерьевна', 'Начальник Отдела экономики социальной защиты и прочих отраслей', 'iv@mail.ru', '15555');
INSERT  INTO kpi.employee(id, name, lastname, firstname, patronym, position, email, phone) VALUES (23,  'user11',
                                                                                                   'Скворцова',
                                                                                                   'Татьяна','Педровна', 'Начальник Отдела строительства объектов социальной сферы','iv@mail.ru', '15555');
INSERT  INTO kpi.employee(id, name, lastname, firstname, patronym, position, email, phone) VALUES (24, 'user12',
                                                                                                   'Кобылко',
                                                                                                   'Александр','Евстафьевич', 'Начальник Отдела экономики образования и культуры/ГБУ ЦНД','iv@mail.ru', '15555');


INSERT  INTO kpi.employee(id, name, lastname, firstname, patronym, position, email, phone) VALUES (25,  'user13',
                                                                                                   'Чирикишвилли',
                                                                                                   'Натэлла','Тамазиковна', 'Советник Отдела экономических нормативов и начальных (максимальных) цен контрактов','iv@mail.ru', '15555');
INSERT  INTO kpi.employee(id, name, lastname, firstname, patronym, position, email, phone) VALUES (26, 'user14',
                                                                                                   'Рукомойкин',
                                                                                                   'Марат','Иванович', 'Главный эксперт Отдела цен и тарифной политики в городском хозяйстве', 'iv@mail.ru', '15555');
INSERT  INTO kpi.employee(id, name, lastname, firstname, patronym, position, email, phone) VALUES (27, 'user15',
                                                                                                   'Лобкова',
                                                                                                   'Аполинария','Модестовна', 'Главный эксперт Отдела развития инженерии','iv@mail.ru', '15555');
INSERT  INTO kpi.employee(id, name, lastname, firstname, patronym, position, email, phone) VALUES (28, 'user16',
                                                                                                   'Филиппова','Анджела','ЦирковаяЛошадь', 'Специалист Отдела экономики социальной защиты и прочих отраслей', 'iv@mail.ru', '15555');
INSERT  INTO kpi.employee(id, name, lastname, firstname, patronym, position, email, phone) VALUES (29, 'user17',
                                                                                                   'Добровольская','Снежанна','Викторовна', 'Инженер Отдела строительства объектов социальной сферы', 'iv@mail.ru', '15555');
INSERT  INTO kpi.employee(id, name, lastname, firstname, patronym, position, email, phone) VALUES (30, 'user18',
                                                                                                   'Голобородько','Инокентий','Петрович', 'Старший специалист Отдела экономики образования и культуры/ГБУ ЦНД', 'iv@mail.ru', '15555');


INSERT  INTO kpi.division_child_division(division_id, child_division_id) VALUES (1, 7);
INSERT  INTO kpi.division_child_division(division_id, child_division_id) VALUES (2, 8);
INSERT  INTO kpi.division_child_division(division_id, child_division_id) VALUES (3, 9);
INSERT  INTO kpi.division_child_division(division_id, child_division_id) VALUES (4, 10);
INSERT  INTO kpi.division_child_division(division_id, child_division_id) VALUES (5, 11);
INSERT  INTO kpi.division_child_division(division_id, child_division_id) VALUES (6, 12);


INSERT  INTO kpi.employee_child_employees(employee_id, child_employee_id) VALUES (13,19);
INSERT  INTO kpi.employee_child_employees(employee_id, child_employee_id) VALUES (14,20);
INSERT  INTO kpi.employee_child_employees(employee_id, child_employee_id) VALUES (15,21);
INSERT  INTO kpi.employee_child_employees(employee_id, child_employee_id) VALUES (16,22);
INSERT  INTO kpi.employee_child_employees(employee_id, child_employee_id) VALUES (17,23);
INSERT  INTO kpi.employee_child_employees(employee_id, child_employee_id) VALUES (18,24);


INSERT  INTO kpi.employee_child_employees(employee_id, child_employee_id) VALUES (19,25);
INSERT  INTO kpi.employee_child_employees(employee_id, child_employee_id) VALUES (20,26);
INSERT  INTO kpi.employee_child_employees(employee_id, child_employee_id) VALUES (21,27);
INSERT  INTO kpi.employee_child_employees(employee_id, child_employee_id) VALUES (22,28);
INSERT  INTO kpi.employee_child_employees(employee_id, child_employee_id) VALUES (23,29);
INSERT  INTO kpi.employee_child_employees(employee_id, child_employee_id) VALUES (24,30);

INSERT  INTO kpi.division_employees(division_id, employee_id) VALUES (1, 13);
INSERT  INTO kpi.division_employees(division_id, employee_id) VALUES (2, 14);
INSERT  INTO kpi.division_employees(division_id, employee_id) VALUES (3, 15);
INSERT  INTO kpi.division_employees(division_id, employee_id) VALUES (4, 16);
INSERT  INTO kpi.division_employees(division_id, employee_id) VALUES (5, 17);
INSERT  INTO kpi.division_employees(division_id, employee_id) VALUES (6, 18);


INSERT  INTO kpi.division_employees(division_id, employee_id) VALUES (7, 19);
INSERT  INTO kpi.division_employees(division_id, employee_id) VALUES (7, 25);
INSERT  INTO kpi.division_employees(division_id, employee_id) VALUES (8, 20);
INSERT  INTO kpi.division_employees(division_id, employee_id) VALUES (8, 26);
INSERT  INTO kpi.division_employees(division_id, employee_id) VALUES (9, 21);
INSERT  INTO kpi.division_employees(division_id, employee_id) VALUES (9, 27);
INSERT  INTO kpi.division_employees(division_id, employee_id) VALUES (10, 22);
INSERT  INTO kpi.division_employees(division_id, employee_id) VALUES (10, 28);
INSERT  INTO kpi.division_employees(division_id, employee_id) VALUES (11, 23);
INSERT  INTO kpi.division_employees(division_id, employee_id) VALUES (11, 29);
INSERT  INTO kpi.division_employees(division_id, employee_id) VALUES (12, 24);
INSERT  INTO kpi.division_employees(division_id, employee_id) VALUES (12, 30);


INSERT  INTO kpi.legal_document(id, name, filename, division_id) VALUES(31, 'Постановление Правительства Москвы от 17.05.2011 № 210-ПП','postanovlenie.docx', 1);
INSERT  INTO kpi.legal_document(id, name, filename, division_id) VALUES(32, 'Положение о Департаменте управления управлений от 17.05.2011 № 210-ПП','polozhenie1.docx', 2);
INSERT  INTO kpi.legal_document(id, name, filename, division_id) VALUES(33, 'Положение о Департаменте о Департаменте от 17.05.2011 № 210-ПП','polozhenie2.docx', 3);
INSERT  INTO kpi.legal_document(id, name, filename, division_id) VALUES(34, 'Устав отдела от 17.05.2011 № 210-ПП','postanovlenie.docx', 4);
INSERT  INTO kpi.legal_document(id, name, filename, division_id) VALUES(35, 'Пположение о положении от 17.05.2011 № 210-ПП','polozhenie3.docx', 5);
INSERT  INTO kpi.legal_document(id, name, filename, division_id) VALUES(36, 'Пположение о положении от 17.05.2011 № 210-ПП','polozhenie4.docx', 6);
INSERT  INTO kpi.legal_document(id, name, filename, division_id) VALUES(37, 'Пположение о положении от 17.05.2011 № 210-ПП','polozhenie5.docx', 7);
INSERT  INTO kpi.legal_document(id, name, filename, division_id) VALUES(38, 'Пположение о положении от 17.05.2011 № 210-ПП','polozhenie6.docx', 8);
INSERT  INTO kpi.legal_document(id, name, filename, division_id) VALUES(39, 'Пположение о положении от 17.05.2011 № 210-ПП','polozhenie7.docx', 9);
INSERT  INTO kpi.legal_document(id, name, filename, division_id) VALUES(40, 'Пположение о положении от 17.05.2011 № 210-ПП','polozhenie8.docx', 10);
INSERT  INTO kpi.legal_document(id, name, filename, division_id) VALUES(41, 'Пположение о положении от 17.05.2011 № 210-ПП','polozhenie9.docx', 11);
INSERT  INTO kpi.legal_document(id, name, filename, division_id) VALUES(42, 'Пположение о положении от 17.05.2011 № 210-ПП','polozhenie10.docx', 12);

INSERT  INTO kpi.goal(id, name, description, create_date, execution_date, control_date) VALUES (43, 'подготовка справок', 'Обеспечивает подготовку справок к проведению совещаний у заместителя Мэра Москвы в Правительстве Москвы по вопросам экономической политики и имущественно-земельных отношений совместно с заинтересованными комплексами (департаментами) города Москвы по вопросам, относящимся к компетенции Управления', '2017-02-15', '2017-02-27', '2017-03-01');
INSERT  INTO kpi.goal(id, name, description, create_date, execution_date, control_date) VALUES (44, 'подготовка справок', 'Обеспечивает подготовку справок к проведению совещаний у заместителя Мэра Москвы в Правительстве Москвы по вопросам экономической политики и имущественно-земельных отношений совместно с заинтересованными комплексами (департаментами) города Москвы по вопросам, относящимся к компетенции Управления', '2017-02-16', '2017-02-28', '2017-03-02');
INSERT  INTO kpi.goal(id, name, description, create_date, execution_date, control_date) VALUES (45, 'подготовка справок', 'Осуществляет рассмотрение предложений органов исполнительной власти по проектам цен и тарифов, нормативов затрат на выполнение функций заказчика-застройщика и других нормативов затрат', '2017-02-17', '2017-02-28', '2017-03-03');
INSERT  INTO kpi.goal(id, name, description, create_date, execution_date, control_date) VALUES (46, 'подготовка справок', 'Обеспечивает подготовку заключений на вносимые федеральными и городскими органами исполнительной власти проекты нормативных правовых актов по вопросам, относящимся к установленной сфере деятельности', '2017-02-18', '2017-03-01', '2017-03-04');
INSERT  INTO kpi.goal(id, name, description, create_date, execution_date, control_date) VALUES (47, 'подготовка справок', 'Обеспечивает подготовку заключений на вносимые федеральными и городскими органами исполнительной власти проекты нормативных правовых актов по вопросам, относящимся к установленной сфере деятельности', '2017-02-19', '2017-03-02', '2017-03-05');
INSERT  INTO kpi.goal(id, name, description, create_date, execution_date, control_date) VALUES (48, 'подготовка справок', 'Обеспечивает подготовку заключений на вносимые федеральными и городскими органами исполнительной власти проекты нормативных правовых актов по вопросам, относящимся к установленной сфере деятельности', '2017-02-20', '2017-03-03', '2017-03-06');

INSERT  INTO kpi.division_goals(goal_id, division_id) VALUES (43, 1);
INSERT  INTO kpi.division_goals(goal_id, division_id) VALUES (44, 2);
INSERT  INTO kpi.division_goals(goal_id, division_id) VALUES (45, 3);
INSERT  INTO kpi.division_goals(goal_id, division_id) VALUES (46, 4);
INSERT  INTO kpi.division_goals(goal_id, division_id) VALUES (47, 5);
INSERT  INTO kpi.division_goals(goal_id, division_id) VALUES (48, 6);

INSERT  INTO kpi.authority(id, name, top_level) VALUES (49, 'Департамент осуществляет свою деятельность во взаимодействии с федеральными органами государственной власти', true);
INSERT  INTO kpi.authority(id, name, top_level) VALUES (50, 'Департамент осуществляет свою деятельность во взаимодействии с федеральными органами государственной власти', true);
INSERT  INTO kpi.authority(id, name, top_level) VALUES (51, 'Департамент осуществляет свою деятельность во взаимодействии с федеральными органами государственной власти', false);
INSERT  INTO kpi.authority(id, name, top_level) VALUES (52, 'Департамент осуществляет свою деятельность во взаимодействии с федеральными органами государственной власти', false);

INSERT  INTO kpi.authority_divisions(authority_id, division_id) VALUES (49, 1);
INSERT  INTO kpi.authority_divisions(authority_id, division_id) VALUES (50, 2);
INSERT  INTO kpi.authority_divisions(authority_id, division_id) VALUES (51, 3);
INSERT  INTO kpi.authority_divisions(authority_id, division_id) VALUES (52, 4);

INSERT  INTO kpi.authority_child_authorities(authority_id, child_authority_id) VALUES (49, 51);
INSERT  INTO kpi.authority_child_authorities(authority_id, child_authority_id) VALUES (50, 52);

INSERT  INTO kpi.authority_employees(authority_id, employee_id) VALUES (49, 22);
INSERT  INTO kpi.authority_employees(authority_id, employee_id) VALUES (50, 23);
INSERT  INTO kpi.authority_employees(authority_id, employee_id) VALUES (51, 22);
INSERT  INTO kpi.authority_employees(authority_id, employee_id) VALUES (52, 23);


--





