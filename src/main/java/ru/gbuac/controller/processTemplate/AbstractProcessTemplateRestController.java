package ru.gbuac.controller.processTemplate;

import javassist.NotFoundException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import ru.gbuac.model.ProcessTemplate;
import ru.gbuac.service.ProcessTemplateService;

import java.util.List;

import static ru.gbuac.util.ValidationUtil.assureIdConsistent;
import static ru.gbuac.util.ValidationUtil.checkNew;

public abstract class AbstractProcessTemplateRestController {

    protected final Logger LOG = LoggerFactory.getLogger(getClass());

    @Autowired
    ProcessTemplateService processTemplateService;

    public ProcessTemplate get(int id) throws NotFoundException {
        LOG.info("get " + id);
        return processTemplateService.get(id);
    }

    public List<ProcessTemplate> getAll() {
        LOG.info("getAll");
        return processTemplateService.getAll();
    }

    public ProcessTemplate create(ProcessTemplate processTemplate) {
        LOG.info("create " + processTemplate);
        checkNew(processTemplate);
        return processTemplateService.save(processTemplate);
    }

    public ProcessTemplate update(ProcessTemplate processTemplate, int id) {
        LOG.info("update " + processTemplate);
        assureIdConsistent(processTemplate, id);
        return processTemplateService.update(processTemplate, id);
    }

    public void delete(int id) {
        LOG.info("delete " + id);
        processTemplateService.delete(id);
    }



}
