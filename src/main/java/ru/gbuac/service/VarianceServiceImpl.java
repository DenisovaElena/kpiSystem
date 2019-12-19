package ru.gbuac.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import ru.gbuac.dao.VarianceRepository;
import ru.gbuac.model.Variance;

import java.util.List;

import static ru.gbuac.util.ValidationUtil.checkNotFoundWithId;

@Service
public class VarianceServiceImpl implements VarianceService {

    @Autowired
    VarianceRepository varianceRepository;

    @Override
    public Variance get(int id) {
        return checkNotFoundWithId(varianceRepository.findById(id).orElse(null), id);
    }

    @Override
    public List<Variance> getAll() {
        return varianceRepository.findAll();
    }

    @Override
    public Variance save(Variance variance) {
        Assert.notNull(variance, "variance must not be null");
        return varianceRepository.save(variance);
    }

    @Override
    public void delete(int id) {
        varianceRepository.delete(id);

    }

    @Override
    public Variance update(Variance variance, int id) {
        Assert.notNull(variance, "variance must not be null");
        Variance savedVariance = checkNotFoundWithId(varianceRepository.save(variance), id);
        return savedVariance;
    }
}
