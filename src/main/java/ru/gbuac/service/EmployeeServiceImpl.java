package ru.gbuac.service;

import javassist.NotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ldap.core.AttributesMapper;
import org.springframework.ldap.core.LdapTemplate;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import ru.gbuac.dao.EmployeeRepository;
import ru.gbuac.dao.RoleRepository;
import ru.gbuac.model.Employee;
import ru.gbuac.to.EmployeeTo;

import javax.naming.NamingException;
import javax.naming.directory.Attribute;
import javax.naming.directory.Attributes;
import javax.naming.directory.SearchControls;
import java.util.List;
import java.util.stream.Collectors;

import static org.springframework.ldap.query.LdapQueryBuilder.query;
import static ru.gbuac.util.ValidationUtil.checkNotFoundWithId;

@Service
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    EmployeeRepository employeeRepository;

    @Autowired(required = true)
    @Qualifier(value = "ldapTemplate")
    private LdapTemplate ldapTemplate;

    @Autowired
    private RoleRepository roleRepository;

    private List<Employee> fetchLdapUsers() {
        SearchControls controls = new SearchControls();
        controls.setSearchScope(SearchControls.SUBTREE_SCOPE);
        List<Employee> employees = ldapTemplate.search(query().where("objectClass").is("person"),
                new EmployeeAttributesMapper());
        return employees.stream().filter(f->f.getFirstname() != null).collect(Collectors.toList());
    }

    @Override
    public List<Employee> getAllLdapUsers() {
        return fetchLdapUsers();
    }

    @Override
    public Employee getByName(String name) throws ru.gbuac.util.exception.NotFoundException {
        return employeeRepository.getByName(name);
    }

    @Override
    public void sinchronizeUsersByLdap() {
        List<Employee> ldapUserList = fetchLdapUsers();
        for(Employee employee: ldapUserList) {
            if (employeeRepository.getByName(employee.getName()) == null) {
                employeeRepository.save(employee);
            }
        }
    }
    @Override
    public Employee get(int id) throws NotFoundException {
        return checkNotFoundWithId(employeeRepository.findById(id).orElse(null), id);
    }

    @Override
    public List<EmployeeTo> getAll() {
        return employeeRepository.getAll();
    }

    @Override
    public List<EmployeeTo> getAllFiltered(String employeeName) {
        return employeeRepository.getAll();
    }

    @Override
    public Employee save(Employee employee) {
        Assert.notNull(employee, "employee must not be null");
        return employeeRepository.save(employee);
    }

    @Override
    public void delete(int id) {
        employeeRepository.delete(id);
    }

    @Override
    public Employee update(Employee employee, int id) {
        Assert.notNull(employee, "employee must not be null");
        Employee savedEmployee = checkNotFoundWithId(employeeRepository.save(employee), id);
        return savedEmployee;
    }

    @Override
    public List<Employee> getEmployeesByChief(int id) {
        return employeeRepository.getEmployeesByChief(id);
    }

    @Override
    public List<Employee> getEmployeesByDivisionId(int id) {
        return employeeRepository.getEmployeesByDivisionId(id);
    }

    private class EmployeeAttributesMapper implements AttributesMapper<Employee> {

        @Override
        public Employee mapFromAttributes(Attributes attributes) throws NamingException {
            Employee employee;
            if (attributes == null) {
                return null;
            }
            employee = new Employee();
            if (attributes.get("samaccountname") != null) {
                employee.setName(attributes.get("samaccountname").get().toString());
            }

            if (attributes.get("name") != null && attributes.get("name").get().toString().split(" ").length == 3) {
                String[] nameAttrs = attributes.get("name").get().toString().split(" ");
                employee.setLastname(nameAttrs[0]);
                employee.setFirstname(nameAttrs[1]);
                employee.setPatronym(nameAttrs[2]);
            }

            if (attributes.get("telephoneNumber") != null) {
                employee.setPhone(attributes.get("telephoneNumber").get().toString());
            }

            if (attributes.get("position") != null) {
                employee.setPhone(attributes.get("position").get().toString());
            }

            return employee;
        }
    }
    private class SingleAttributesMapper implements AttributesMapper<String> {

        @Override
        public String mapFromAttributes(Attributes attrs) throws NamingException {
            Attribute cn = attrs.get("cn");
            return cn.toString();
        }
    }
}
