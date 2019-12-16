package ru.gbuac.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;
import java.util.List;

@Entity
@NoArgsConstructor
@Getter
@Setter
@Table(name = "division")
public class Division extends NamedEntity {

    @Column(name="top_level")
    private boolean topLevel;

    @JsonIgnore
    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinTable(name = "division_employees",
            joinColumns = @JoinColumn(name = "division_id"),
            inverseJoinColumns = @JoinColumn(name = "employee_id")
    )
    private List<Employee> employees;

    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinTable(name = "division_child_division",
            joinColumns = @JoinColumn(name = "division_id"),
            inverseJoinColumns = @JoinColumn(name = "child_division_id")
    )
    private List<Division> childDivision;

    @JsonIgnore
    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinTable(name = "division_goals",
            joinColumns = @JoinColumn(name = "division_id"),
            inverseJoinColumns = @JoinColumn(name = "goal_id")
    )
    private List<Goal> goals;

    @JsonIgnore
    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinTable(name = "authority_divisions",
            joinColumns = @JoinColumn(name = "division_id"),
            inverseJoinColumns = @JoinColumn(name = "authority_id")
    )
    private List<Authority> authorities;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "chief_employee_id", nullable = true)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JsonInclude
    private Employee chiefEmployee;

    @OneToOne(mappedBy = "division", cascade = CascadeType.ALL)
    private LegalDocument legalDocument;

    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinTable(name = "role_divisions", joinColumns = @JoinColumn(name = "role_id"), inverseJoinColumns =
    @JoinColumn(name = "division_id"))
    private List<Role> roles;

    @JsonIgnore
    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinTable(name = "division_variances",
            joinColumns = @JoinColumn(name = "division_id"),
            inverseJoinColumns = @JoinColumn(name = "variance_id")
    )
    private List<Variance> variances;


}
