package ru.gbuac.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import ru.gbuac.model.Variance;

public interface VarianceRepository extends JpaRepository<Variance, Integer> {

    @Transactional
    @Modifying
    @Query("DELETE FROM Variance v WHERE v.id=:id")
    void delete(@Param("id") int id);
}
