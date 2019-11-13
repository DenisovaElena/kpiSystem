package ru.gbuac.controller.authority;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = AuthorityRestController.REST_URL, produces = MediaType.APPLICATION_JSON_VALUE)
public class AuthorityRestController extends AbstractAuthorityRestController {
    public static final String REST_URL = "/rest/profile/authorities";


}
