package ru.gbuac.controller.process;

import javassist.NotFoundException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import ru.gbuac.model.Process;
import ru.gbuac.service.ProcessService;

import java.util.List;

import static ru.gbuac.util.ValidationUtil.assureIdConsistent;
import static ru.gbuac.util.ValidationUtil.checkNew;

public class AbstractProcessRestController {
    protected final Logger LOG = LoggerFactory.getLogger(getClass());

    @Autowired
    ProcessService processService;

    public Process get(int id) throws NotFoundException {
        LOG.info("get " + id);
        return processService.get(id);
    }

    public List<Process> getAll() {
        LOG.info("getAll");
        return processService.getAll();
    }

    public Process create(Process authority) {
        LOG.info("create " + authority);
        checkNew(authority);
        return processService.save(authority);
    }

    public Process update(Process authority, int id) {
        LOG.info("update " + authority);
        assureIdConsistent(authority, id);
        return processService.update(authority, id);
    }

    public void delete(int id) {
        LOG.info("delete " + id);
        processService.delete(id);
    }


}
