package ru.gbuac.model;

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
@Table(name = "process_template")
public class ProcessTemplate extends NamedEntity {

    @SafeHtml
    @Column(name = "descroption")
    private String description;

    @Column(name = "duration")
    private Integer duration;
}
