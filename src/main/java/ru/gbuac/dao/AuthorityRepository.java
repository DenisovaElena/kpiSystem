package ru.gbuac.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;
import ru.gbuac.model.Authority;

import java.util.List;

public interface AuthorityRepository extends JpaRepository<Authority, Integer> {
    @Transactional
    @Modifying
    @Query("DELETE FROM Authority a WHERE a.id=:id")
    int delete(@Param("id") int id);

    @Query("SELECT a FROM Authority a WHERE a.topLevel=true")
    List<Authority> getAllTopLevel();
}