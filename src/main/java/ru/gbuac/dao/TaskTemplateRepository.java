package ru.gbuac.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;
import ru.gbuac.model.TaskTemplate;

public interface TaskTemplateRepository extends JpaRepository<TaskTemplate, Integer> {
    @Transactional
    @Modifying
    @Query("DELETE FROM TaskTemplate t WHERE t.id =:id")
    int delete(@Param("id") int id);
}
