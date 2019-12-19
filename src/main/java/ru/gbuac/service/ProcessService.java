package ru.gbuac.service;

import ru.gbuac.model.Process;

import java.util.List;

public interface ProcessService {

    Process get(int id);

    List<Process> getAll();

    int delete(int id);

    Process save(Process process);

    Process update(Process process, int id);
}
