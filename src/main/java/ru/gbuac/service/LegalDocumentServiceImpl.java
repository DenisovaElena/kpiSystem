package ru.gbuac.service;

import javassist.NotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import ru.gbuac.dao.LegalDocumentRepository;
import ru.gbuac.model.LegalDocument;

import java.util.List;

import static ru.gbuac.util.ValidationUtil.checkNotFoundWithId;

@Service
public class LegalDocumentServiceImpl implements LegalDocumentService {

    @Autowired
    LegalDocumentRepository legalDocumentRepository;

    @Override
    public LegalDocument get(int id) throws NotFoundException {
        return checkNotFoundWithId(legalDocumentRepository.findById(id).orElse(null), id);
    }

    @Override
    public List<LegalDocument> getAll() {
        return legalDocumentRepository.findAll();
    }

    @Override
    public LegalDocument save(LegalDocument legalDocument, int id) {
        Assert.notNull(legalDocument, "catalog must not be null");
        return legalDocumentRepository.save(legalDocument);
    }

    @Override
    public void delete(int id) {
        legalDocumentRepository.delete(id);
    }

    @Override
    public LegalDocument update(LegalDocument legalDocument, int id) {
        Assert.notNull(legalDocument, "catalog must not be null");
        LegalDocument savedLegalDocument = checkNotFoundWithId(legalDocumentRepository.save(legalDocument), id);
        return savedLegalDocument;
    }
}
