package ru.gbuac.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import org.hibernate.validator.constraints.SafeHtml;

import javax.persistence.*;
import java.util.List;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Table(name = "process_template")
public class ProcessTemplate extends NamedEntity {

    @SafeHtml
    @Column(name = "description")
    private String description;

    @Column(name = "duration")
    private Integer duration;

    @JsonIgnore
    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinTable(name = "process_process_templates",
            joinColumns = @JoinColumn(name = "process_template_id"),
            inverseJoinColumns = @JoinColumn(name = "process_id")
    )
    private List<Process> processes;

//    @ManyToOne(fetch = FetchType.EAGER, optional = false)
//    @JoinColumn(name = "authority_id", nullable = false)
//    @OnDelete(action = OnDeleteAction.CASCADE)
//    @JsonInclude
//    private Authority authority;
}
