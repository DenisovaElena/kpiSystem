package ru.gbuac.service;

import javassist.NotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import ru.gbuac.dao.AuthorityRepository;
import ru.gbuac.model.Authority;
import ru.gbuac.to.AuthorityTo;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static ru.gbuac.util.ValidationUtil.checkNotFoundWithId;

@Service
public class AuthorityServiceImpl implements AuthorityService {

    @Autowired
    AuthorityRepository authorityRepository;

    @Override
    public Authority get(int id) throws NotFoundException {
        return checkNotFoundWithId(authorityRepository.findById(id).orElse(null), id);
    }

    @Override
    public List<Authority> getAll() {
        return authorityRepository.findAll();
    }

    @Override
    public Authority save(Authority authority) {
        Assert.notNull(authority, "catalog must not be null");
        return authorityRepository.save(authority);
    }

    @Override
    public void delete(int id) {
        authorityRepository.delete(id);
    }

    @Override
    public Authority update(Authority authority, int id) {
        Assert.notNull(authority, "catalog must not be null");
        Authority savedAuthority = checkNotFoundWithId(authorityRepository.save(authority), id);
        return savedAuthority;
    }

    @Override
    public List<Authority> getAllTopLevel() {
        return authorityRepository.getAllTopLevel();
    }

    @Override
    public List<Authority> getAuthoritiesByDivisionId(int id) {
        return authorityRepository.getAuthoritiesByDivisionId(id);
    }

    @Override
    public List<Authority> searchAuthorities(String word) {
        List<Authority> returned;
        if (word.equals("")) {
            returned= null;
        }
        else returned = authorityRepository.searchAuthorities(word);
        return returned;
    }
}
