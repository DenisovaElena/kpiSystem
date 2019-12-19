package ru.gbuac.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import ru.gbuac.dao.ProcessRepository;
import ru.gbuac.model.Process;

import java.util.List;

import static ru.gbuac.util.ValidationUtil.checkNotFoundWithId;

@Service
public class ProcessServiceImpl implements ProcessService {

    @Autowired
    ProcessRepository processRepository;

    @Override
    public Process get(int id) {
        return checkNotFoundWithId(processRepository.findById(id).orElse(null), id);
    }

    @Override
    public List<Process> getAll() {
        return processRepository.findAll();
    }

    @Override
    public int delete(int id) {
        return processRepository.delete(id);
    }

    @Override
    public Process save(Process process) {
        Assert.notNull(process, "process must not be null");
        return processRepository.save(process);
    }

    @Override
    public Process update(Process process, int id) {
        Assert.notNull(process, "process must not be null");
        Process savedProcess = checkNotFoundWithId(processRepository.save(process), id);
        return savedProcess;
    }
}
