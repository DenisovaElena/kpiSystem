package ru.gbuac.controller.taskTemplate;

import javassist.NotFoundException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import ru.gbuac.model.TaskTemplate;
import ru.gbuac.service.TaskTemplateService;

import java.util.List;

import static ru.gbuac.util.ValidationUtil.assureIdConsistent;
import static ru.gbuac.util.ValidationUtil.checkNew;

public abstract class AbstractTaskTemplateRestController {

    protected final Logger LOG = LoggerFactory.getLogger(getClass());

    @Autowired
    TaskTemplateService taskTemplateService;

    public TaskTemplate get(int id) throws NotFoundException {
        LOG.info("get " + id);
        return taskTemplateService.get(id);
    }

    public List<TaskTemplate> getAll() {
        LOG.info("getAll");
        return taskTemplateService.getAll();
    }

    public TaskTemplate create(TaskTemplate taskTemplate) {
        LOG.info("create " + taskTemplate);
        checkNew(taskTemplate);
        return taskTemplateService.save(taskTemplate);
    }

    public TaskTemplate update(TaskTemplate taskTemplate, int id) {
        LOG.info("update " + taskTemplate);
        assureIdConsistent(taskTemplate, id);
        return taskTemplateService.update(taskTemplate, id);
    }

    public void delete(int id) {
        LOG.info("delete " + id);
        taskTemplateService.delete(id);
    }
}
