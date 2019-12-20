package ru.gbuac.controller.taskTemplate;

import javassist.NotFoundException;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import ru.gbuac.model.TaskTemplate;

import javax.validation.Valid;
import java.util.List;

public class TaskTemplateRestController extends AbstractTaskTemplateRestController {

    public static final String REST_URL = "/rest/profile/taskTemplates";

    @Override
    @GetMapping(value = "/{id}")
    public TaskTemplate get(@PathVariable("id") int id) throws NotFoundException {
        return super.get(id);
    }

    @Override
    @DeleteMapping(value = "/{id}")
    public void delete(@PathVariable("id") int id) {
        super.delete(id);
    }

    @PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
    public TaskTemplate updateOrCreate(@Valid @RequestBody TaskTemplate authority) {
        if (authority.isNew()) {
            return super.create(authority);
        } else {
            return super.update(authority, authority.getId());
        }
    }

    @Override
    @GetMapping
    public List<TaskTemplate> getAll() {
        return super.getAll();
    }
}
