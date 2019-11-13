package ru.gbuac.service;

import ru.gbuac.model.Division;

public interface DivisionService {
    Division save(int id);
    Division create(int id, String name);
    void delete(int id);
    Division update(int id);
}
