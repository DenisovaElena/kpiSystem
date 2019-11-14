package ru.gbuac.controller.legaldocument;

import javassist.NotFoundException;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import ru.gbuac.model.LegalDocument;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping(value = LegalDocumentRestController.REST_URL, produces = MediaType.APPLICATION_JSON_VALUE)
public class LegalDocumentRestController extends AbstractLegalDocumentRestController {
    public static final String REST_URL = "/rest/profile/legalDocuments";

    @Override
    @GetMapping
    public List<LegalDocument> getAll() {
        return super.getAll();
    }

    @Override
    @GetMapping(value = "/{id}")
    public LegalDocument get(@PathVariable("id") int id) throws NotFoundException {
        return super.get(id);
    }

    @Override
    @DeleteMapping(value = "/{id}")
    public void delete(@PathVariable("id") int id) {
        super.delete(id);
    }

    @PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
    public LegalDocument updateOrCreate(@Valid @RequestBody LegalDocument legalDocument) {
        if (legalDocument.isNew()) {
            return super.create(legalDocument);
        } else {
            return super.update(legalDocument, legalDocument.getId());
        }
    }
}
