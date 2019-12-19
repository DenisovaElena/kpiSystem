package ru.gbuac.service;

import ru.gbuac.model.Task;

import java.util.List;

public interface TaskService {

    Task get(int id);

    List<Task> getAll();

    int delete(int id);

    Task save(Task task);

    Task update(Task task, int id);
}
