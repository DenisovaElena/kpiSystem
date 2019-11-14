package ru.gbuac.controller.goal;

import javassist.NotFoundException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import ru.gbuac.model.Goal;
import ru.gbuac.service.GoalService;

import java.util.List;

import static ru.gbuac.util.ValidationUtil.assureIdConsistent;
import static ru.gbuac.util.ValidationUtil.checkNew;

public abstract class AbstractGoalRestController {
    protected final Logger LOG = LoggerFactory.getLogger(getClass());

    @Autowired
    GoalService goalService;

    public Goal get(int id) throws NotFoundException {
        LOG.info("get " + id);
        return goalService.get(id);
    }

    public List<Goal> getAll() {
        LOG.info("getAll");
        return goalService.getAll();
    }

    public Goal create(Goal goal) {
        LOG.info("create " + goal);
        checkNew(goal);
        return goalService.save(goal);
    }

    public Goal update(Goal goal, int id) {
        LOG.info("update " + goal);
        assureIdConsistent(goal, id);
        return goalService.update(goal, id);
    }

    public void delete(int id) {
        LOG.info("delete " + id);
        goalService.delete(id);
    }
}
