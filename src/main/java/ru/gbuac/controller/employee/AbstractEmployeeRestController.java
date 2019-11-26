package ru.gbuac.controller.employee;

import javassist.NotFoundException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import ru.gbuac.AuthorizedUser;
import ru.gbuac.model.Employee;
import ru.gbuac.service.EmployeeService;
import ru.gbuac.to.EmployeeTo;

import java.util.List;

import static ru.gbuac.util.ValidationUtil.assureIdConsistent;
import static ru.gbuac.util.ValidationUtil.checkNew;

public abstract class AbstractEmployeeRestController {
    protected final Logger LOG = LoggerFactory.getLogger(getClass());

    @Autowired
    EmployeeService employeeService;

    public Employee get(int id) throws NotFoundException {
        LOG.info("get " + id);
        return employeeService.get(id);
    }

    public List<EmployeeTo> getAll() {
        LOG.info("getAll");
        return employeeService.getAll();
    }

    public Employee create(Employee employee) {
        LOG.info("create " + employee);
        checkNew(employee);
        return employeeService.save(employee);
    }

    public Employee update(Employee employee, int id) throws NotFoundException {
        LOG.info("update " + employee);
        assureIdConsistent(employee, id);
        return employeeService.update(employee, id);
    }

    public void delete(int id) throws NotFoundException {
        LOG.info("delete " + id);
        employeeService.delete(id);
    }

    public List<Employee> getEmployeesByChief(int id) {
        LOG.info("getEmployeesByChief" + id);
        return employeeService.getEmployeesByChief(id);
    }

    public List<Employee> getEmployeesByDivisionId(int id) {
        LOG.info("/getEmployeesByDivisionId");
        return employeeService.getEmployeesByDivisionId(id);
    }

    List<Employee> getAllLdapUsers() {
        LOG.info("getAllLdapUsers");
        return employeeService.getAllLdapUsers();
    }

    public void sinchronizeUsersByLdap() {
        LOG.info("sinchronizeUsersByLdap");
        employeeService.sinchronizeUsersByLdap();
    }

    Employee getByName(String name) throws NotFoundException {
        LOG.info("getByName");
        return employeeService.getByName(name);
    }
    List<EmployeeTo> getAllFiltered() {
        LOG.info("getAllFiltered");
        return employeeService.getAllFiltered(AuthorizedUser.getUserName());
    }
}
