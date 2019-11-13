package ru.gbuac.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@NoArgsConstructor
@Getter
@Setter
@Table(name = "division")
public class Division extends NamedEntity {
    @ManyToOne
    @JoinColumn(name = "employee_id", referencedColumnName = "division_id")
    private Employee employee;
}
