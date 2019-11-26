package ru.gbuac.controller.employee;

import javassist.NotFoundException;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import ru.gbuac.model.Employee;
import ru.gbuac.to.EmployeeTo;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping(value = EmployeeRestController.REST_URL, produces = MediaType.APPLICATION_JSON_VALUE)
public class EmployeeRestController extends AbstractEmployeeRestController {
    public static final String REST_URL = "/rest/profile/employees";

    @Override
    @GetMapping
    public List<EmployeeTo> getAll() {
        return super.getAll();
    }

    @Override
    @GetMapping(value = "/{id}")
    public Employee get(@PathVariable("id") int id) throws NotFoundException {
        return super.get(id);
    }

    @Override
    @DeleteMapping(value = "/{id}")
    public void delete(@PathVariable("id") int id) throws NotFoundException {
        super.delete(id);
    }

    @PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
    public Employee updateOrCreate(@Valid @RequestBody Employee employee) throws NotFoundException {
        if (employee.isNew()) {
            return super.create(employee);
        } else {
            return super.update(employee, employee.getId());
        }
    }

    @GetMapping(value = "/getEmployeesByChief/{id}")
    public List<Employee> getEmployeesByChief(@PathVariable int id) {
        return super.getEmployeesByChief(id);
    }

    @GetMapping(value = "/getEmployeesByDivisionId/{id}")
    public List<Employee> getEmployeesByDivisionId(@PathVariable("id") int id) {
        return super.getEmployeesByDivisionId(id);
    }

    @Override
    @GetMapping(value = "/getAllLdapUsers")
    public List<Employee> getAllLdapUsers() {
        return super.getAllLdapUsers();
    }

    @Override
    @GetMapping(value = "/getByName")
    Employee getByName(@RequestParam("name") String name) throws NotFoundException {
        return super.getByName(name);
    }

    @Override
    @GetMapping(value = "/filtered")
    List<EmployeeTo> getAllFiltered() {
        return super.getAll();
    }

    @Override
    @PostMapping(value = "/sinchronizeUsersByLdap", consumes = MediaType.APPLICATION_JSON_VALUE)
    public void sinchronizeUsersByLdap() {
        super.sinchronizeUsersByLdap();
    }
}
