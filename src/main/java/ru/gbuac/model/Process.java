package ru.gbuac.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;
import org.hibernate.validator.constraints.SafeHtml;
import ru.gbuac.util.DateTimeUtil;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Table(name = "process")
public class Process extends NamedEntity {

    @SafeHtml
    @Column(name = "description")
    private String description;

    @Column(name = "create_date")
    private Date createDate;

    @Column(name = "execution_date")
    private Date executionDate;

    @Column(name = "control_date")
    private Date controlDate;

    @JsonIgnore
    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinTable(name = "process_process_templates",
            joinColumns = @JoinColumn(name = "process_id"),
            inverseJoinColumns = @JoinColumn(name = "process_template_id")
    )
    private List<ProcessTemplate> processTemplates;
}
