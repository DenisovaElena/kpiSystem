package ru.gbuac.service;

import javassist.NotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import ru.gbuac.dao.DivisionRepository;
import ru.gbuac.model.Division;

import java.util.List;

import static ru.gbuac.util.ValidationUtil.checkNotFoundWithId;

@Service
public class DivisionServiceImpl implements DivisionService {

    @Autowired
    DivisionRepository divisionRepository;

    @Override
    public Division get(int id) throws NotFoundException {
        return null;
    }

    @Override
    public List<Division> getAll() {
        return null;
    }

    @Override
    public Division save(Division division, int id) {
        Assert.notNull(division, "division must not be null");
        Division savedDivision = checkNotFoundWithId(divisionRepository.save(division), id);
        return savedDivision;
    }

    @Override
    public Division create(Division division) {
        return null;
    }

    @Override
    public void delete(int id) {

    }

    @Override
    public Division update(Division division, int id) {
        return null;
    }

    @Override
    public List<Division> getTopLevel() {
        return null;
    }
}
