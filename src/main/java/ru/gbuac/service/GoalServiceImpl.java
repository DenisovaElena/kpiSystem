package ru.gbuac.service;

import javassist.NotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import ru.gbuac.dao.GoalRepository;
import ru.gbuac.model.Goal;

import java.util.List;

import static ru.gbuac.util.ValidationUtil.checkNotFoundWithId;

@Service
public class GoalServiceImpl implements GoalService {

    @Autowired
    GoalRepository goalRepository;

    @Override
    public Goal get(int id) throws NotFoundException {
        return checkNotFoundWithId(goalRepository.findById(id).orElse(null), id);
    }

    @Override
    public List<Goal> getAll() {
        return goalRepository.findAll();
    }

    @Override
    public Goal save(Goal goal) {
        Assert.notNull(goal, "catalog must not be null");
        return goalRepository.save(goal);
    }

    @Override
    public void delete(int id) {
        goalRepository.delete(id);
    }

    @Override
    public Goal update(Goal goal, int id) {
        Assert.notNull(goal, "catalog must not be null");
        Goal savedGoal = checkNotFoundWithId(goalRepository.save(goal), id);
        return savedGoal;
    }
}
