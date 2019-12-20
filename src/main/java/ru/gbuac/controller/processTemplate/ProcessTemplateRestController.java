package ru.gbuac.controller.processTemplate;

import javassist.NotFoundException;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import ru.gbuac.model.ProcessTemplate;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping(value = ProcessTemplateRestController.REST_URL, produces = MediaType.APPLICATION_JSON_VALUE)
public class ProcessTemplateRestController extends AbstractProcessTemplateRestController {

    public static final String REST_URL = "/rest/profile/processTemplates";

    @Override
    @GetMapping(value = "/{id}")
    public ProcessTemplate get(@PathVariable("id") int id) throws NotFoundException {
        return super.get(id);
    }

    @Override
    @DeleteMapping(value = "/{id}")
    public void delete(@PathVariable("id") int id) {
        super.delete(id);
    }

    @PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
    public ProcessTemplate updateOrCreate(@Valid @RequestBody ProcessTemplate processTemplate) {
        if (processTemplate.isNew()) {
            return super.create(processTemplate);
        } else {
            return super.update(processTemplate, processTemplate.getId());
        }
    }

    @Override
    @GetMapping
    public List<ProcessTemplate> getAll() {
        return super.getAll();
    }
}
