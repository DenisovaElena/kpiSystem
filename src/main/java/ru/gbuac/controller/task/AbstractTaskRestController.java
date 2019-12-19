package ru.gbuac.controller.task;

import javassist.NotFoundException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import ru.gbuac.model.Task;
import ru.gbuac.service.TaskService;

import java.util.List;

import static ru.gbuac.util.ValidationUtil.assureIdConsistent;
import static ru.gbuac.util.ValidationUtil.checkNew;

public abstract class AbstractTaskRestController {
    protected final Logger LOG = LoggerFactory.getLogger(getClass());

    @Autowired
    TaskService taskService;

    public Task get(int id) throws NotFoundException {
        LOG.info("get " + id);
        return taskService.get(id);
    }

    public List<Task> getAll() {
        LOG.info("getAll");
        return taskService.getAll();
    }

    public Task create(Task task) {
        LOG.info("create " + task);
        checkNew(task);
        return taskService.save(task);
    }

    public Task update(Task task, int id) {
        LOG.info("update " + task);
        assureIdConsistent(task, id);
        return taskService.update(task, id);
    }

    public void delete(int id) {
        LOG.info("delete " + id);
        taskService.delete(id);
    }
}
