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

    @GetMapping(value = "/constructor")
    public String constructor() {
        return "constructor";
    }

    @GetMapping(value = "/all-tasks")
    public String allTasks() {
        return "all-tasks";
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
        return "template";
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

    @GetMapping(value = "/instruction")
    public String instruction() { return "instruction"; }

    @GetMapping(value = "/process")
    public String process() { return "process"; }

    @GetMapping(value = "/project")
    public String project() { return "project"; }

    @GetMapping(value = "/registered")
    public String registered() { return "registered"; }

    @GetMapping(value = "/distribution")
    public String distribution() { return "distribution"; }

    @GetMapping(value = "/distributed")
    public String distributed() { return "distributed"; }

    @GetMapping(value = "/creator")
    public String creator() { return "creator"; }
}
