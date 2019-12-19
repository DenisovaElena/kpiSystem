package ru.gbuac.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import ru.gbuac.dao.TaskRepository;
import ru.gbuac.model.Task;

import java.util.List;

import static ru.gbuac.util.ValidationUtil.checkNotFoundWithId;

@Service
public class TaskServiceImpl implements TaskService{

    @Autowired
    TaskRepository taskRepository;

    @Override
    public Task get(int id) {
        return checkNotFoundWithId(taskRepository.findById(id).orElse(null), id);
    }

    @Override
    public List<Task> getAll() {
        return taskRepository.findAll();
    }

    @Override
    public int delete(int id) {
        return taskRepository.delete(id);
    }

    @Override
    public Task save(Task task) {
        Assert.notNull(task, "task must not be null");
        return taskRepository.save(task);
    }

    @Override
    public Task update(Task task, int id) {
        Assert.notNull(task, "task must not be null");
        Task savedTask = checkNotFoundWithId(taskRepository.save(task), id);
        return savedTask;
    }
}
