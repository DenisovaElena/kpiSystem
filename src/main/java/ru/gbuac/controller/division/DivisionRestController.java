package ru.gbuac.controller.division;

import javassist.NotFoundException;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import ru.gbuac.model.Division;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping(value = DivisionRestController.REST_URL, produces = MediaType.APPLICATION_JSON_VALUE)
public class DivisionRestController extends AbstractDivisionRestCotroller {
    public static final String REST_URL = "rest/profile/divisions";

    @Override
    @GetMapping
    public List<Division> getAll() {
        return super.getAll();
    }

    @Override
    @GetMapping(value = "/{id}")
    public Division get(@PathVariable("id") int id) throws NotFoundException {
        return super.get(id);
    }

    @Override
    @DeleteMapping(value = "/{id}")
    public void delete(@PathVariable("id") int id) {
        super.delete(id);
    }

    @PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
    public Division updateOrCreate(@Valid @RequestBody Division division) {
        if (division.isNew()) {
            return super.create(division);
        } else {
            return super.update(division, division.getId());
        }
    }

    @Override
    @GetMapping(value = "/getAllTopLevel")
    public List<Division> getAllTopLevel() {
        return super.getAllTopLevel();
    }
}
