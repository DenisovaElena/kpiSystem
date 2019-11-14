package ru.gbuac.controller.legaldocument;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = LegalDocumentRestController.REST_URL, produces = MediaType.APPLICATION_JSON_VALUE)
public class LegalDocumentRestController extends AbstractLegalDocumentRestController {
    public static final String REST_URL = "/rest/profile/legalDocuments";
}
