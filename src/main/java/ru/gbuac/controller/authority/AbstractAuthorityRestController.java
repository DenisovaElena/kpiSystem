package ru.gbuac.controller.authority;

import javassist.NotFoundException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import ru.gbuac.dao.AuthorityRepository;
import ru.gbuac.model.Authority;
import ru.gbuac.service.AuthorityService;

import java.util.List;

import static ru.gbuac.util.ValidationUtil.assureIdConsistent;
import static ru.gbuac.util.ValidationUtil.checkNew;

public abstract class AbstractAuthorityRestController {
    protected final Logger LOG = LoggerFactory.getLogger(getClass());

    @Autowired
    AuthorityService authorityService;

    public Authority get(int id) throws NotFoundException {
        LOG.info("get " + id);
        return authorityService.get(id);
    }

    public List<Authority> getAll() {
        LOG.info("getAll");
        return authorityService.getAll();
    }

    public Authority create(Authority authority) {
        LOG.info("create " + authority);
        checkNew(authority);
        return authorityService.save(authority);
    }

    public Authority update(Authority authority, int id) {
        LOG.info("update " + authority);
        assureIdConsistent(authority, id);
        return authorityService.update(authority, id);
    }

    public void delete(int id) {
        LOG.info("delete " + id);
        authorityService.delete(id);
    }
}
