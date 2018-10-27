package zw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin/authrule")
public class AuthruleController {
    @RequestMapping("index")
    public String index(){
        return "admin/authrule/index";
    }
}
