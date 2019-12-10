package ru.gbuac.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;
import ru.gbuac.model.Authority;
import ru.gbuac.to.AuthorityTo;

import java.util.List;
import java.util.Optional;

public interface AuthorityRepository extends JpaRepository<Authority, Integer> {
    @Transactional
    @Modifying
    @Query("DELETE FROM Authority a WHERE a.id=:id")
    int delete(@Param("id") int id);

    @Query("SELECT a FROM Authority a WHERE a.topLevel=true")
    List<Authority> getAllTopLevel();

    @Query("SELECT a FROM Authority a JOIN a.divisions d WHERE d.id=:id")
    List<Authority> getAuthoritiesByDivisionId(@Param("id") int id);

    @Query("SELECT a FROM Authority a WHERE LOWER(a.name) LIKE CONCAT('%', LOWER(:name), '%')")
    List<Authority> searchAuthorities(@Param("name") String name);

    @Query("SELECT a FROM Authority a JOIN a.employees e WHERE e.id=:id AND a.topLevel=true")
    List<Authority> getAllTopLevelAuthoritiesByEmployeeId(@Param("id") int id);

    @Query("SELECT a FROM Authority a JOIN a.childAuthorities c WHERE c.id=:childId")
    List<Authority> getAllTopLevelAuthoritiesByChildAuthorityId(@Param("childId") int childId);
}
