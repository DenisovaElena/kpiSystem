package ru.gbuac.service;

import ru.gbuac.model.ProcessTemplate;

import java.util.List;

public interface ProcessTemplateService {

    ProcessTemplate get(int id);

    List<ProcessTemplate> getAll();

    int delete(int id);

    ProcessTemplate save(ProcessTemplate processTemplate);

    ProcessTemplate update(ProcessTemplate processTemplate, int id);
}
