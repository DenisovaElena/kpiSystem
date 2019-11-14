package ru.gbuac.service;

import javassist.NotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import ru.gbuac.dao.EmployeeRepository;
import ru.gbuac.model.Employee;

import java.util.List;

import static ru.gbuac.util.ValidationUtil.checkNotFoundWithId;

@Service
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    EmployeeRepository employeeRepository;

    @Override
    public Employee get(int id) throws NotFoundException {
        return checkNotFoundWithId(employeeRepository.findById(id).orElse(null), id);
    }

    @Override
    public List<Employee> getAll() {
        return employeeRepository.findAll();
    }

    @Override
    public Employee save(Employee employee) {
        Assert.notNull(employee, "catalog must not be null");
        return employeeRepository.save(employee);
    }

    @Override
    public void delete(int id) {
        employeeRepository.delete(id);
    }

    @Override
    public Employee update(Employee employee, int id) {
        Assert.notNull(employee, "catalog must not be null");
        Employee savedEmployee = checkNotFoundWithId(employeeRepository.save(employee), id);
        return savedEmployee;
    }
}
