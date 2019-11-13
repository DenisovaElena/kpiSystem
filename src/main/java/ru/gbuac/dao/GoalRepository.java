package ru.gbuac.dao;

import org.springframework.transaction.annotation.Transactional;

@Transactional(readOnly = true)
public interface GoalRepository {
}
