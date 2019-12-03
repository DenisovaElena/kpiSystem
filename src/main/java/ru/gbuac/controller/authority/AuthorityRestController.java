package ru.gbuac.controller.authority;

import javassist.NotFoundException;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import ru.gbuac.model.Authority;
import ru.gbuac.to.AuthorityTo;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping(value = AuthorityRestController.REST_URL, produces = MediaType.APPLICATION_JSON_VALUE)
public class AuthorityRestController extends AbstractAuthorityRestController {

    public static final String REST_URL = "/rest/profile/authorities";

    @Override
    @GetMapping(value = "/{id}")
    public Authority get(@PathVariable("id") int id) throws NotFoundException {
        return super.get(id);
    }

    @Override
    @DeleteMapping(value = "/{id}")
    public void delete(@PathVariable("id") int id) {
        super.delete(id);
    }

    @PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
    public Authority updateOrCreate(@Valid @RequestBody Authority authority) {
        if (authority.isNew()) {
            return super.create(authority);
        } else {
            return super.update(authority, authority.getId());
        }
    }

    @Override
    @GetMapping
    public List<Authority> getAll() {
        return super.getAll();
    }

    @Override
    @GetMapping("/getAllTopLevel")
    public List<Authority> getAllTopLevel() {
        return super.getAllTopLevel();
    }

    @Override
    @GetMapping("/getAuthoritiesByDivisionId/{id}")
    public List<Authority> getAuthoritiesByDivisionId(@PathVariable("id") int id) {
        return super.getAuthoritiesByDivisionId(id);
    }

    @Override
    @GetMapping("/searchAuthorities")
    public List<Authority> searchAuthorities(@RequestParam("word") String word) {
        return super.searchAuthorities(word);
    }

    @Override
    @GetMapping("/getAuthoritiesByEmployeeId/{id}")
    public List<Authority> getAllTopLevelAuthoritiesByEmployeeId(@PathVariable("id") int id) {
        return authorityService.getAllTopLevelAuthoritiesByEmployeeId(id);
    }
}
