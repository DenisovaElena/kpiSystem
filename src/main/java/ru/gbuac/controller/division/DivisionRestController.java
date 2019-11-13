package ru.gbuac.controller.division;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = DivisionRestController.REST_URL, produces = MediaType.APPLICATION_JSON_VALUE)
public class DivisionRestController extends AbstractDivisionRestCotroller {
    public static final String REST_URL = "rest/profile/divisions";

}
