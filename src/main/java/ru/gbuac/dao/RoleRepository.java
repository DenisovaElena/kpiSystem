package ru.gbuac.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;
import ru.gbuac.model.Division;
import ru.gbuac.model.Role;

import java.util.List;

@Transactional(readOnly = true)
public interface RoleRepository extends JpaRepository<Role, Integer> {
    @Transactional
    @Modifying
    @Query("DELETE FROM Role r WHERE r.id=:id")
    int delete(@Param("id") int id);

    @Query("SELECT r FROM Role r JOIN r.employees e WHERE lower(e.name)=lower(:userName)")
    List<Role> getRolesByUsername(@Param("userName") String userName);

    @Query(value = "SELECT r.* FROM kpi.role r WHERE 'ROLE_'||=:name " +
            "UNION "+
            "SELECT r.* FROM kpi.role r WHERE r.id IN " +
            "(SELECT c.child_role_id FROM kpi.role rr, kpi.role_child_roles c WHERE rr.id = c.role_id AND 'ROLE_'||rr.name=:name)",
            nativeQuery = true)
    List<Role> getRoles(@Param("name") String name);

    @Query("SELECT r FROM Role r JOIN r.divisions d WHERE d.id=:id")
    List<Division> getDivisionsByRoleId(@Param("id") int id);
}
