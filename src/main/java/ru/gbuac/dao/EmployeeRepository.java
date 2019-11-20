package ru.gbuac.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;
import ru.gbuac.model.Authority;
import ru.gbuac.model.Employee;

import java.util.List;

public interface EmployeeRepository extends JpaRepository<Employee, Integer> {
    @Transactional
    @Modifying
    @Query("DELETE FROM Employee e WHERE e.id=:id")
    int delete(@Param("id") int id);

    @Query("SELECT e FROM Employee e JOIN e.divisions d JOIN d.chiefEmployee c " +
            "WHERE d.id=:id AND e.id <> c.id")
    List<Employee> getEmployeesByChief(@Param("id") int id);
}
