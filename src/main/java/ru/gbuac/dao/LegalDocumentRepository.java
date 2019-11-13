package ru.gbuac.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;
import ru.gbuac.model.LegalDocument;

public interface LegalDocumentRepository extends JpaRepository<LegalDocument, Integer> {
    @Transactional
    @Modifying
    @Query("DELETE FROM LegalDocument l WHERE l.id=:id")
    int delete(@Param("id") int id);
}
