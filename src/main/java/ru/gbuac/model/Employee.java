package ru.gbuac.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.validator.constraints.SafeHtml;

import javax.persistence.*;
import java.util.List;

@Entity
@NoArgsConstructor
@Getter
@Setter
@Table(name = "employee")
public class Employee extends BaseEntity {

    @SafeHtml
    @Column(name = "firstname")
    private String firstname;

    @SafeHtml
    @Column(name = "lastname")
    private String lastname;

    @SafeHtml
    @Column(name = "patronym")
    private String patronym;

    @SafeHtml
    @Column(name = "position")
    private String position;

    @SafeHtml
    @Column(name = "email")
    private String email;

    @SafeHtml
    @Column(name = "phone")
    private String phone;

    @JsonIgnore
    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<Division> divisions;

    @JsonIgnore
    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinTable(name = "employee_child_employees",
            joinColumns = @JoinColumn(name = "employee_id"),
            inverseJoinColumns = @JoinColumn(name = "child_employee_id")
    )
    private List<Employee> childEmployees;
}
