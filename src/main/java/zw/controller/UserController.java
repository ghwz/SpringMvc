package zw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin/user")
public class UserController {
    @RequestMapping("index")
    public String index(){
        return "admin/user/index";
    }
}
