package ru.gbuac.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RootController {

    @Autowired
    private MessageSource messageSource;

    @GetMapping("/")
    public String root() {
        return "redirect:login";
    }

    @GetMapping(value = "/authorities")
    public String myQuest() {
        return "authorities";
    }

    @GetMapping(value = "/login")
    public String login() {
        return "login";
    }
}
