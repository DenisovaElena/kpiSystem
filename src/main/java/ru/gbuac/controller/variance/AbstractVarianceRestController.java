package ru.gbuac.controller.variance;

import javassist.NotFoundException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import ru.gbuac.model.Variance;
import ru.gbuac.service.VarianceService;

import java.util.List;

import static ru.gbuac.util.ValidationUtil.assureIdConsistent;
import static ru.gbuac.util.ValidationUtil.checkNew;

public abstract class AbstractVarianceRestController {
    protected final Logger LOG = (Logger) LoggerFactory.getLogger(getClass());

    @Autowired
    VarianceService varianceService;

    public Variance get(int id) throws NotFoundException {
        LOG.info("get " + id);
        return varianceService.get(id);
    }

    public List<Variance> getAll() {
        LOG.info("getAll");
        return varianceService.getAll();
    }

    public Variance create(Variance variance) {
        LOG.info("create " + variance);
        checkNew(variance);
        return varianceService.save(variance);
    }

    public Variance update(Variance variance, int id) {
        LOG.info("update " + variance);
        assureIdConsistent(variance, id);
        return varianceService.update(variance, id);
    }

    public void delete(int id) {
        LOG.info("delete " + id);
        varianceService.delete(id);
    }
}
