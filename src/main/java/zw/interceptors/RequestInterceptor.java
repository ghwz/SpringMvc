package zw.interceptors;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import zw.pojo.AuthAccess;
import zw.pojo.AuthRule;
import zw.pojo.User;
import zw.service.AuthAccessService;
import zw.service.AuthRuleService;
import zw.utils.Constant;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
public class RequestInterceptor implements   HandlerInterceptor {
    @Resource
    private AuthAccessService authAccessService;
    @Resource
    private AuthRuleService authRuleService;
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        System.out.println("-------preHandle-------"+httpServletRequest.getRequestURI());
        User user=(User)httpServletRequest.getSession().getAttribute(Constant.getProperty("session_name_key"));
        System.out.println(user);
        if(user==null){
            System.out.println("-------重新登录-------"+(httpServletRequest.getContextPath()+"/login/index"));

            httpServletResponse.sendRedirect(httpServletRequest.getContextPath()+"/login/index");
            return false;
        }
        //权限菜单
        Long roleId=user.getRoleId();
        List<AuthRule> authRuleList;

        if(roleId==1){
            //超级管理员
            authRuleList=authRuleService.getLevelData(null);
        }else{
            List<AuthAccess> list = authAccessService.getIdsByRoleid(roleId);
            authRuleList=authRuleService.getLevelData(list);
        }
        httpServletRequest.setAttribute("menus",authRuleList);
        httpServletRequest.setAttribute("controllerMethod",httpServletRequest.getRequestURI());
        return true;
    }

    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) {
        System.out.println("-------postHandle-------");

    }

    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) {
        System.out.println("-------afterCompletion-------");
    }
}
