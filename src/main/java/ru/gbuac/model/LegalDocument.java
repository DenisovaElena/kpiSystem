package ru.gbuac.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.validator.constraints.SafeHtml;

import javax.persistence.*;

@Entity
@NoArgsConstructor
@Getter
@Setter
@Table(name = "legal_document")
public class LegalDocument extends NamedEntity {

    @SafeHtml
    @Column(name = "filename")
    private String fileName;

    @OneToOne
    @JoinColumn(name = "division_id", referencedColumnName = "id")
    @JsonIgnore
    private Division division;
}
