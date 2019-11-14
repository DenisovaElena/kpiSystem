package ru.gbuac.controller.goal;

import javassist.NotFoundException;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import ru.gbuac.model.Goal;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping(value = GoalRestController.REST_URL, produces = MediaType.APPLICATION_JSON_VALUE)
public class GoalRestController extends AbstractGoalRestController {
    public static final String REST_URL = "/rest/profile/goals";

    @Override
    @GetMapping
    public List<Goal> getAll() {
        return super.getAll();
    }

    @Override
    @GetMapping(value = "/{id}")
    public Goal get(@PathVariable("id") int id) throws NotFoundException {
        return super.get(id);
    }

    @Override
    @DeleteMapping(value = "/{id}")
    public void delete(@PathVariable("id") int id) {
        super.delete(id);
    }

    @PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
    public Goal updateOrCreate(@Valid @RequestBody Goal goal) {
        if (goal.isNew()) {
            return super.create(goal);
        } else {
            return super.update(goal, goal.getId());
        }
    }
}
