package ru.gbuac.service;

import javassist.NotFoundException;
import ru.gbuac.model.Goal;

import java.util.List;

public interface GoalService {

    Goal get(int id) throws NotFoundException;

    List<Goal> getAll();

    Goal save(Goal goal, int id);

    void delete(int id);

    Goal update(Goal goal, int id);
}
