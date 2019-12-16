package ru.gbuac.service;

import ru.gbuac.model.Variance;

import java.util.List;

public interface VarianceService {

    Variance get(int id);

    List<Variance> getAll();

    Variance save(Variance variance);

    void delete(int id);

    Variance update(Variance variance, int id);
}
