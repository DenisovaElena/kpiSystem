package ru.gbuac.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;
import ru.gbuac.model.Process;

public interface ProcessRepository extends JpaRepository<Process, Integer> {

    @Transactional
    @Modifying
    @Query("DELETE FROM Process p WHERE p.id =:id")
    int delete(@Param("id") int id);

}
