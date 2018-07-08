package com.paic.ai.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.rpc.ServiceException;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.paic.ai.dto.AiUser;
import com.paic.ai.dto.ResponseResult;
import com.paic.ai.service.IAIUserService;
import com.paic.ai.utils.CaptchaUtil;

@Controller
@RequestMapping("/main")
public class LoginController {

    private static Logger log = Logger.getLogger(LoginController.class);
    @Autowired
    private IAIUserService IAIUserService;
   /* @RequestMapping("/login")
    public String defaultPage(HttpServletRequest request,Model model){
        return "login";
    }
   */
    
    @RequestMapping("/successLogin")
    public ModelAndView login(HttpServletRequest request,ModelAndView model){
        System.out.println("进入servlet");
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        AiUser user = new AiUser();
        user.setUserName(userName);
        user.setPassword(password);
        model.addObject("user",user);
        model.setViewName("main");
        System.out.println("end servlet");
        return model;
    }
    
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request,HttpServletResponse response){
        HttpSession session = request.getSession();
        session.invalidate();
        return "login";
    }
    
    @RequestMapping("/validateLogin")
    public void validateLogin(HttpServletRequest request,HttpServletResponse response) throws ServiceException{
        String loginObj = request.getParameter("loginObj");
        JSONObject loginJson = JSONObject.parseObject(loginObj);
        String accountNo = loginJson.getString("userName");
        String pwd = loginJson.getString("password");
        String valiDate = loginJson.getString("valiDate");
        AiUser user = IAIUserService.selectByUserName(accountNo);
        JSONObject result = new JSONObject();
        if (null == user) {
            result.put("accountMsg", "用户名不存在");
        } else if (!pwd.equals(user.getPassword())) {
            result.put("pwdMsg", "用户名密码错误");
        } else if (!valiDate.equals(request.getSession().getAttribute("code"))) {
            result.put("valiDate", "验证码错误");
        } else {
            request.getSession().setAttribute("userName", accountNo);
            result.put("user", user);
        }
        String resultStr = result.toJSONString();
        //以下可封装
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        PrintWriter out = null;
        try {
            out = response.getWriter();
            //若发送数据为null 则默认为""
            if(resultStr == null){
                resultStr = "";
            }
            out.write(resultStr);
        }
        catch (IOException e) {
            log.error(e.getLocalizedMessage(), e);
        }
        finally {
            if (out != null){
                out.close();
            }
        }
    }
    
    @RequestMapping("/checkCode")
    public void createCheckCode(HttpServletRequest request,HttpServletResponse response) throws IOException{
     // 通知浏览器不要缓存  
        response.setHeader("Expires", "-1");  
        response.setHeader("Cache-Control", "no-cache");  
        response.setHeader("Pragma", "-1");  
        CaptchaUtil util = CaptchaUtil.Instance();  
        // 将验证码输入到session中，用来验证  
        String code = util.getString();  
        request.getSession().setAttribute("code", code);  
        // 输出打web页面  
        ImageIO.write(util.getImage(), "jpg", response.getOutputStream()); 
    }
    
    @RequestMapping("/getUserList")
    @ResponseBody
    public ResponseResult<AiUser> getUserList(HttpServletRequest request,AiUser user){
        String userName = request.getParameter("Name");
        Map<String,Object> paramMap = new HashMap<String,Object>();
        paramMap.put("userName", userName);
        List<AiUser> list = null;
        try {
            list = IAIUserService.queryUserList(paramMap);
            if (null == list) {
                list = new ArrayList<AiUser>();
            }
        } catch (ServiceException e) {
            e.printStackTrace();
        }
        return new ResponseResult<AiUser>(list,list.size()); 
    }
}
