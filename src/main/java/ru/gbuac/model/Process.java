package ru.gbuac.model;

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
}
