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
        return checkNotFoundWithId(divisionRepository.findById(id).orElse(null), id);
    }

    @Override
    public List<Division> getAll() {
        return divisionRepository.findAll();
    }

    @Override
    public Division save(Division division, int id) {
        Assert.notNull(division, "catalog must not be null");
        return divisionRepository.save(division);
    }

    @Override
    public void delete(int id) {
        divisionRepository.delete(id);
    }

    @Override
    public Division update(Division division, int id) {
        Assert.notNull(division, "catalog must not be null");
        Division savedDivision = checkNotFoundWithId(divisionRepository.save(division), id);
        return savedDivision;
    }

    @Override
    public List<Division> getAllTopLevel() {
        return divisionRepository.getAllTopLevel();
    }
}
