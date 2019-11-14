package ru.gbuac.controller.employee;

import javassist.NotFoundException;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import ru.gbuac.model.Employee;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping(value = EmployeeRestController.REST_URL, produces = MediaType.APPLICATION_JSON_VALUE)
public class EmployeeRestController extends AbstractEmployeeRestController {
    public static final String REST_URL = "/rest/profile/employees";

    @Override
    @GetMapping
    public List<Employee> getAll() {
        return super.getAll();
    }

    @Override
    @GetMapping(value = "/{id}")
    public Employee get(@PathVariable("id") int id) throws NotFoundException {
        return super.get(id);
    }

    @Override
    @DeleteMapping(value = "/{id}")
    public void delete(@PathVariable("id") int id) {
        super.delete(id);
    }

    @PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
    public Employee updateOrCreate(@Valid @RequestBody Employee employee) {
        if (employee.isNew()) {
            return super.create(employee);
        } else {
            return super.update(employee, employee.getId());
        }
    }
}
