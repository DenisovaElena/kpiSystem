package ru.gbuac.service;

import javassist.NotFoundException;
import ru.gbuac.model.LegalDocument;

import java.util.List;

public interface LegalDocumentService {

    LegalDocument get(int id) throws NotFoundException;

    List<LegalDocument> getAll();

    LegalDocument save(LegalDocument legalDocument);

    void delete(int id);

    LegalDocument update(LegalDocument legalDocument, int id);
}
