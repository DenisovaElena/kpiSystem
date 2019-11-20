package ru.gbuac.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
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
    private List<Employee> employees;

    @JsonIgnore
    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private List<Division> childDivision;

    @JsonIgnore
    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<Goal> goals;

    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<Authority> authorities;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "chief_employee_id", nullable = true)
    @OnDelete(action = OnDeleteAction.CASCADE)
    private Employee chiefEmployee;

    @OneToOne(mappedBy = "division", cascade = CascadeType.ALL)
    private LegalDocument legalDocument;
}
