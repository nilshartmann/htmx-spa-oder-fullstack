package nh.recipify.domain.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HelloWorldController {

    /**
     * "Regulärer" GET-Controller, der das hello-world.html-Template zurückliefert
     */
    @GetMapping("/hello")
    public String hello() {
        return "hello-world";
    }

    /* todo: Mapping-Methode fuer HTMX Request

        hwc
     */
    @GetMapping(value = "/hello-world", headers = "HX-Request")
    String helloWorldResponse() {

        // 🕵️‍♂️  Template angucken!
        return "hello-world-response";
    }


}
