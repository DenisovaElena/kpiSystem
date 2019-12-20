package ru.gbuac.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.validator.constraints.SafeHtml;

import javax.persistence.*;
import java.util.List;

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

    @Column(name = "duration")
    private Integer duration;

    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "process_template_id", nullable = false)
    private ProcessTemplate processTemplate;

    @JsonIgnore
    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinTable(name = "task_task_templates",
            joinColumns = @JoinColumn(name = "task_template_id"),
            inverseJoinColumns = @JoinColumn(name = "task_id")
    )
    private List<Process> processes;
}
