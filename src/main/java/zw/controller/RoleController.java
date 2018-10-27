package zw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import zw.pojo.Role;
import zw.service.RoleService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("admin/role")
public class RoleController {
    @Resource
    private RoleService roleService;
    @RequestMapping("index")
    public String index(){
        return "admin/role/index";
    }

    /**
     * 列表
     * @return
     */
    @RequestMapping("getListJSON")
    public @ResponseBody List<Role> getList(HttpServletRequest request){
        Map<String,Object> params=new HashMap<String,Object>();
        params.put("offset",request.getParameter("offset"));
        params.put("limit",request.getParameter("limit"));
        return roleService.getAllRoleList(params);
    }
    @RequestMapping("edit")
    public String edit(){
        return "admin/role/edit";
    }
}
