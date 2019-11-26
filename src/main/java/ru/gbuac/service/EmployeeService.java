package ru.gbuac.service;

import javassist.NotFoundException;
import ru.gbuac.model.Employee;
import ru.gbuac.to.EmployeeTo;

import java.util.List;

public interface EmployeeService {

    Employee get(int id) throws NotFoundException;

    List<EmployeeTo> getAll();

    Employee save(Employee employee);

    void delete(int id) throws NotFoundException ;

    Employee update(Employee employee, int id) throws NotFoundException;

    List<Employee> getEmployeesByChief(int id);

    List<Employee> getEmployeesByDivisionId(int id);

    void sinchronizeUsersByLdap();

    List<Employee> getAllLdapUsers();

    Employee getByName(String name) throws NotFoundException;

    List<EmployeeTo> getAllFiltered(String employeeName);
}
