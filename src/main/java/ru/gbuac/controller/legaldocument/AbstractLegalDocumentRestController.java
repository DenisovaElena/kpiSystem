package ru.gbuac.controller.legaldocument;

import javassist.NotFoundException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import ru.gbuac.model.LegalDocument;
import ru.gbuac.service.LegalDocumentService;

import java.util.List;

import static ru.gbuac.util.ValidationUtil.assureIdConsistent;
import static ru.gbuac.util.ValidationUtil.checkNew;

public abstract class AbstractLegalDocumentRestController {
    protected final Logger LOG = LoggerFactory.getLogger(getClass());

    @Autowired
    LegalDocumentService legalDocumentService;

    public LegalDocument get(int id) throws NotFoundException {
        LOG.info("get " + id);
        return legalDocumentService.get(id);
    }

    public List<LegalDocument> getAll() {
        LOG.info("getAll");
        return legalDocumentService.getAll();
    }

    public LegalDocument create(LegalDocument legalDocument) {
        LOG.info("create " + legalDocument);
        checkNew(legalDocument);
        return legalDocumentService.save(legalDocument);
    }

    public LegalDocument update(LegalDocument legalDocument, int id) {
        LOG.info("update " + legalDocument);
        assureIdConsistent(legalDocument, id);
        return legalDocumentService.update(legalDocument, id);
    }

    public void delete(int id) {
        LOG.info("delete " + id);
        legalDocumentService.delete(id);
    }
}
