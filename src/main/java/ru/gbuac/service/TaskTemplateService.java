package ru.gbuac.service;

import ru.gbuac.model.TaskTemplate;

import java.util.List;

public interface TaskTemplateService {

    TaskTemplate get(int id);

    List<TaskTemplate> getAll();

    int delete(int id);

    TaskTemplate save(TaskTemplate taskTemplate);

    TaskTemplate update(TaskTemplate taskTemplate, int id);
}
