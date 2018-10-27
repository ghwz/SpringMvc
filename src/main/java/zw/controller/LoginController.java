package zw.controller;

import com.google.code.kaptcha.Constants;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import zw.pojo.User;
import zw.service.UserService;
import zw.utils.Constant;
import zw.utils.Util;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("login")
public class LoginController {
    @Resource
    private UserService userService;

    /**
     * 登录
     *
     * @return
     */
    @RequestMapping("index")
    public String index() {
        return "login/index";
    }

    /**
     * 验证登录
     *
     * @return
     */
    @RequestMapping(value = "/doLogin", method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> doLogin(HttpServletRequest request, HttpSession session) {
        String mobile = request.getParameter("mobile");
        String password = request.getParameter("password");
        String captcha = request.getParameter("captcha");
        String original = (String) request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);
        Map<String, Object> map = new HashMap<String, Object>();
        if (!original.toLowerCase().equals(captcha.toLowerCase())) {
            map.put("code", "fail");
            map.put("msg", "验证码错误");
            return map;
        }
        User user = userService.findByUsername(mobile);
        if (user == null || "".equals(user)) {
            map.put("code", "fail");
            map.put("msg", "输入的用户名或密码错误，请重新输入");
            return map;
        }
        String ascPassword = Util.md5(Util.md5(Constant.getProperty("user_auth_key")) + password);
        if (!ascPassword.equals(user.getPassword())) {
            map.put("code", "fail");
            map.put("msg", "输入的用户名或密码错误，请重新输入");
            return map;
        }
        user.setPassword("");
        session.setAttribute(Constant.getProperty("session_name_key"),user);
        map.put("code", "ok");
        map.put("url", "/admin/index/index");
        return map;
    }
    @RequestMapping("out")
    public String out(HttpSession session){
        session.invalidate();
        return "login/index";
    }
}
