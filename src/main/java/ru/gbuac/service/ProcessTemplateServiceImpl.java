package ru.gbuac.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import ru.gbuac.dao.ProcessTemplateRepository;
import ru.gbuac.model.ProcessTemplate;

import java.util.List;

import static ru.gbuac.util.ValidationUtil.checkNotFoundWithId;

@Service
public class ProcessTemplateServiceImpl implements ProcessTemplateService {

    @Autowired
    ProcessTemplateRepository processTemplateRepository;

    @Override
    public ProcessTemplate get(int id) {
        return checkNotFoundWithId(processTemplateRepository.findById(id).orElse(null), id);
    }

    @Override
    public List<ProcessTemplate> getAll() {
        return processTemplateRepository.findAll();
    }

    @Override
    public int delete(int id) {
        return processTemplateRepository.delete(id);
    }

    @Override
    public ProcessTemplate save(ProcessTemplate processTemplate) {
        Assert.notNull(processTemplate, "processTemplate must not be null");
        return processTemplateRepository.save(processTemplate);
    }

    @Override
    public ProcessTemplate update(ProcessTemplate processTemplate, int id) {
        Assert.notNull(processTemplate, "processTemplate must not be null");
        ProcessTemplate savedProcessTemplate = checkNotFoundWithId(processTemplateRepository.save(processTemplate), id);
        return savedProcessTemplate;
    }
}
