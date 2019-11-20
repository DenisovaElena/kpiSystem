package ru.gbuac.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Entity
@NoArgsConstructor
@Getter
@Setter
@Table(name = "authority")
public class Authority extends NamedEntity {

    @Column(name = "top_level")
    private boolean topLevel;

    @JsonIgnore
    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<Division> divisions;
}
