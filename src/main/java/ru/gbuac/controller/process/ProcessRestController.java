package ru.gbuac.controller.process;

import javassist.NotFoundException;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import ru.gbuac.model.Process;

import javax.validation.Valid;

@RestController
@RequestMapping(value = ProcessRestController.REST_URL, produces = MediaType.APPLICATION_JSON_VALUE)
public class ProcessRestController extends AbstractProcessRestController {

    public static final String REST_URL = "/rest/profile/processes";

    @Override
    @GetMapping(value = "/{id}")
    public Process get(@PathVariable("id") int id) throws NotFoundException {
        return super.get(id);
    }

    @Override
    @DeleteMapping(value = "/{id}")
    public void delete(@PathVariable("id") int id) {
        super.delete(id);
    }

    @PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
    public Process updateOrCreate(@Valid @RequestBody Process process) {
        if (process.isNew()) {
            return super.create(process);
        } else {
            return super.update(process, process.getId());
        }
    }
}
