package ru.gbuac.controller.division;

import javassist.NotFoundException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import ru.gbuac.model.Division;
import ru.gbuac.service.DivisionService;

import java.util.List;

import static ru.gbuac.util.ValidationUtil.assureIdConsistent;
import static ru.gbuac.util.ValidationUtil.checkNew;

public abstract class AbstractDivisionRestController {
    protected final Logger LOG = LoggerFactory.getLogger(getClass());

    @Autowired
    DivisionService divisionService;

    public Division get(int id) throws NotFoundException {
        LOG.info("get " + id);
        return divisionService.get(id);
    }

    public List<Division> getAll() {
        LOG.info("getAll");
        return divisionService.getAll();
    }

    public Division create(Division division) {
        LOG.info("create " + division);
        checkNew(division);
        return divisionService.save(division);
    }

    public Division update(Division division, int id) {
        LOG.info("update " + division);
        assureIdConsistent(division, id);
        return divisionService.update(division, id);
    }

    public void delete(int id) {
        LOG.info("delete " + id);
        divisionService.delete(id);
    }

    public List<Division> getAllTopLevel() {
        LOG.info("getAllTopLevelDivision");
        return divisionService.getAllTopLevel();
    }

    public List<Division> getChildDivisionByDivisionId(int id) {
        LOG.info("getChildDivisionByDivisionId");
        return divisionService.getChildDivisionByDivisionId(id);
    }

    public List<Division> getDivisionByAuthorityId(int id) {
        LOG.info("getDivisionByAuthorityId");
        return divisionService.getDivisionByAuthorityId(id);
    }
}
