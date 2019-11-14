package ru.gbuac.service;

import javassist.NotFoundException;
import ru.gbuac.model.Employee;

import java.util.List;

public interface EmployeeService {

    Employee get(int id) throws NotFoundException;

    List<Employee> getAll();

    Employee save(Employee employee);

    void delete(int id);

    Employee update(Employee employee, int id);
}
