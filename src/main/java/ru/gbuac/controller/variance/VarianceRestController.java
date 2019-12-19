package ru.gbuac.controller.variance;

import javassist.NotFoundException;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import ru.gbuac.model.Variance;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping(value = VarianceRestController.REST_URL, produces = MediaType.APPLICATION_JSON_VALUE)
public class VarianceRestController extends AbstractVarianceRestController {

    public static final String REST_URL = "/rest/profile/variances";

    @Override
    @GetMapping(value = "/{id}")
    public Variance get(@PathVariable("id") int id) throws NotFoundException {
        return super.get(id);
    }

    @Override
    @DeleteMapping(value = "/{id}")
    public void delete(@PathVariable("id") int id) {
        super.delete(id);
    }

    @PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
    public Variance updateOrCreate(@Valid @RequestBody Variance variance) {
        if (variance.isNew()) {
            return super.create(variance);
        } else {
            return super.update(variance, variance.getId());
        }
    }

    @Override
    @GetMapping
    public List<Variance> getAll() {
        return super.getAll();
    }
}
