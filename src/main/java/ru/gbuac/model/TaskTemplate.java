package ru.gbuac.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.validator.constraints.SafeHtml;

import javax.persistence.*;
import java.util.Date;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Table(name = "task_template")
public class TaskTemplate extends NamedEntity {

    @SafeHtml
    @Column(name = "description")
    private String description;

    @Column(name = "create_date")
    private Date createDate;

    @Column(name = "execution_date")
    private Date executionDate;

    @Column(name = "control_date")
    private Date controlDate;

    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "process_template_id", nullable = false)
    private ProcessTemplate processTemplate;
}
