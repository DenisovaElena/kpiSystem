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

    @GetMapping(value = "/division")
    public String division() {
        return "division";
    }

    @GetMapping(value = "/admin/quests")
    public String quests() {
        return "admin/quests";
    }

    @GetMapping(value = "/admin/quest")
    public String edit() {
        return "admin/quest";
    }

    @GetMapping(value = "/my-quests")
    public String myQuests() {
        return "my-quests";
    }

    @GetMapping(value = "/my-quest")
    public String myQuest() {
        return "my-quest";
    }

    @GetMapping(value = "/login")
    public String login() {
        return "login";
    }

    @GetMapping(value = "/managements")
    public String managements() {
        return "managements";
    }

    @GetMapping(value = "/index")
    public String index() {
        return "all";
    }

    @GetMapping(value = "/template")
    public String template() {
        return "template";
    }

    @GetMapping(value = "/administrators")
    public String administrators() {
        return "administrators";
    }

    @GetMapping(value = "/departments")
    public String departments() { return "departments"; }

    @GetMapping(value = "/employees")
    public String employees() { return "employees"; }

    @GetMapping(value = "/all")
    public String all() { return "all"; }

    @GetMapping(value = "/in-work")
    public String inWork() { return "in-work"; }

    @GetMapping(value = "/agreement")
    public String agreement() { return "agreement"; }

    @GetMapping(value = "/agreed")
    public String agreed() { return "agreed"; }

    @GetMapping(value = "/registered")
    public String registered() { return "registered"; }

    @GetMapping(value = "/distribution")
    public String distribution() { return "distribution"; }

    @GetMapping(value = "/distributed")
    public String distributed() { return "distributed"; }
}
