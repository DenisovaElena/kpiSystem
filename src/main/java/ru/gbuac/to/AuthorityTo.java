package ru.gbuac.to;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.util.List;

@EqualsAndHashCode(callSuper = true)
@Data
@NoArgsConstructor
public class AuthorityTo extends BaseTo {

        private String name;

        private Integer parentId;

        public AuthorityTo(Integer id, String name, Integer parentId) {
            super(id);
            this.name = name;
            this.parentId = parentId;
        }
}
