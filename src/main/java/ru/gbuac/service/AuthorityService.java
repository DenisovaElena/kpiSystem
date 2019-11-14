package ru.gbuac.service;

import javassist.NotFoundException;
import ru.gbuac.model.Authority;

import java.util.List;

public interface AuthorityService {

    Authority get(int id) throws NotFoundException;

    List<Authority> getAll();

    Authority save(Authority authority, int id);

    void delete(int id);

    Authority update(Authority authority, int id);
}
