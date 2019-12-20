package ru.gbuac.controller.task;

import javassist.NotFoundException;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import ru.gbuac.model.Task;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping(value = TaskRestController.REST_URL, produces = MediaType.APPLICATION_JSON_VALUE)
public class TaskRestController extends AbstractTaskRestController {
    public static final String REST_URL = "/rest/profile/tasks";

    @Override
    @GetMapping
    public List<Task> getAll() {
        return super.getAll();
    }

    @Override
    @GetMapping(value = "/{id}")
    public Task get(@PathVariable("id") int id) throws NotFoundException {
        return super.get(id);
    }

    @Override
    @DeleteMapping(value = "/{id}")
    public void delete(@PathVariable("id") int id) {
        super.delete(id);
    }

    @PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
    public Task updateOrCreate(@Valid @RequestBody Task task) {
        if (task.isNew()) {
            return super.create(task);
        } else {
            return super.update(task, task.getId());
        }
    }
}
