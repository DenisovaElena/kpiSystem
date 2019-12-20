package ru.gbuac.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;
import ru.gbuac.dao.TaskTemplateRepository;
import ru.gbuac.model.TaskTemplate;

import java.util.List;

import static ru.gbuac.util.ValidationUtil.checkNotFoundWithId;

public class TaskTemplateServiceImpl implements TaskTemplateService {

    @Autowired
    TaskTemplateRepository taskTemplateRepository;

    @Override
    public TaskTemplate get(int id) {
        return checkNotFoundWithId(taskTemplateRepository.findById(id).orElse(null), id);
    }

    @Override
    public List<TaskTemplate> getAll() {
        return taskTemplateRepository.findAll();
    }

    @Override
    public int delete(int id) {
        return taskTemplateRepository.delete(id);
    }

    @Override
    public TaskTemplate save(TaskTemplate taskTemplate) {
        Assert.notNull(taskTemplate, "taskTemplate must not be null");
        return taskTemplateRepository.save(taskTemplate);
    }

    @Override
    public TaskTemplate update(TaskTemplate taskTemplate, int id) {
        Assert.notNull(taskTemplate, "taskTemplate must not be null");
        TaskTemplate savedTaskTemplate = checkNotFoundWithId(taskTemplateRepository.save(taskTemplate), id);
        return savedTaskTemplate;
    }
}
