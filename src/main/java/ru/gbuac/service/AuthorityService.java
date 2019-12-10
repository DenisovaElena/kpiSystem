package ru.gbuac.service;

import javassist.NotFoundException;
import ru.gbuac.model.Authority;
import ru.gbuac.to.AuthorityTo;

import java.util.List;

public interface AuthorityService {

    Authority get(int id) throws NotFoundException;

    List<Authority> getAll();

    Authority save(Authority authority);

    void delete(int id);

    Authority update(Authority authority, int id);

    List<Authority> getAllTopLevel();

    List<Authority> getAuthoritiesByDivisionId(int id);

   List<Authority> searchAuthorities(String word);

   List<Authority> getAllTopLevelAuthoritiesByEmployeeId(int id);

    List<Authority> getAllTopLevelAuthoritiesByChildAuthorityId(int childId);
}
