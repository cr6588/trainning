package com.cheny.message;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cheny.admin.AdminService;
import com.cheny.household.HouseholdService;
import com.cheny.teacher.TeacherService;
import com.cheny.web.bean.Admin;
import com.cheny.web.bean.Household;
import com.cheny.web.bean.Message;
import com.cheny.web.bean.ResultPage;
import com.cheny.web.bean.Teacher;
import com.cheny.web.service.UploadService;
import com.cheny.web.util.Pager;
import com.cheny.web.util.RequestUtil;
import com.cheny.web.util.ResultMsg;

@Controller
public class MessageAction {

    @Autowired
    private MessageService messageService;
    @Autowired
    private UploadService uploadService;
    @Autowired
    private TeacherService teacherService;
    @Autowired
    private HouseholdService householdService;
    @Autowired
    private AdminService adminService;
    /**
     * 页面跳转函数
     */
    @RequestMapping(value = "/message/{pageName}", method = RequestMethod.GET)
    public ModelAndView viewAdminManagePages(HttpServletRequest request, @PathVariable("pageName") String pageName) throws Exception {
        HashMap<String,Object> hashMap = RequestUtil.getRequestParam(request);
        if(pageName.equals("messageInfo") || pageName.equals("messageInfoSent")){
            Message message = messageService.getMessageById(Integer.parseInt(hashMap.get("id").toString()));
            hashMap.put("message", message);
        }
        return new ModelAndView("/message/" + pageName, hashMap);
    }

    private String uploadAttachement(Integer id, String typeName, MultipartFile file, HttpServletRequest request) {
        try {
            String path = request.getSession().getServletContext().getRealPath("/resources/userFile/");
            /* split用正则匹配“.”是关键字，要用“\\”转义 */
            String suffix = file.getOriginalFilename().split("\\.")[1];
            String finalFilename = id + typeName + "." + suffix;
            uploadService.uploadFile(file, path, finalFilename);
            return "/resources/userFile/" + finalFilename;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 添加消息
     */
    @RequestMapping(value = "/addMessage", method = RequestMethod.POST)
    @ResponseBody
    public ResultMsg addMessage(HttpServletRequest request,
                               Message message,
                               @RequestParam(value = "content", required = true) String content) {
        try {
            if(message.getGetUserType() == 1 && teacherService.getTeacherByUsername(message.getGetUserUsername()) == null || message.getGetUserType() == 2 && householdService.getHouseholdByUsername(message.getGetUserUsername()) == null){
                return new ResultMsg(1, "没有该用户");
            }
            if(message.getGetUserType() == 3 && message.getGetUserUsername().equals("")){
                Admin admin = adminService.getRandAdmin();
                message.setGetUserUsername(admin.getUsername());
                message.setGetUserId(admin.getId());
            }else if(message.getGetUserType() == 1){
                Teacher teacher = teacherService.getTeacherByUsername(message.getGetUserUsername());
                message.setGetUserId(teacher.getId());
            }else if(message.getGetUserType() == 2){
                Household household = householdService.getHouseholdByUsername(message.getGetUserUsername());
                message.setGetUserId(household.getId());
            }else if(message.getGetUserType() == 3){
                if(!message.getGetUserUsername().equals("") && !message.getGetUserUsername().equals("administrator") && adminService.getAdminByUsername(message.getGetUserUsername()) == null){
                    return new ResultMsg(1, "没有该用户");
                }
                Admin admin = new Admin();
                if(message.getGetUserUsername().equals("administrator")){
                    admin.setId(0);
                }else{
                    admin = adminService.getAdminByUsername(message.getGetUserUsername());
                }
                message.setGetUserId(admin.getId());
            }
            message.setContent(content);
            message.setSendType(1);
            messageService.addMessage(message);
            return new ResultMsg(0, "发送成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultMsg(1, "发送失败");
        }
    }

    @RequestMapping(value = "/getMessageById", method = RequestMethod.POST)
    @ResponseBody
    public Message getMessageById(@RequestParam("id") Integer id) {
        try {
            return messageService.getMessageById(id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    /**
     * 更改消息
     */
    @RequestMapping(value = "/updateMessage", method = RequestMethod.POST)
    @ResponseBody
    public ResultMsg updateMessage(HttpServletRequest request) {
        HashMap<String, Object> hashMap = RequestUtil.getRequestParam(request);
        try {
            messageService.updateMessage(hashMap);
            return new ResultMsg(0, "更改成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultMsg(1, "更改失败");
        }
    }
//    @RequestMapping(value = "/getMessageTypeByBigMessageTypeId", method = RequestMethod.POST)
//    @ResponseBody
//    public List<MessageType> getMessageTypeByBigMessageTypeId(@RequestParam("bigMessageTypeId") Integer bigMessageTypeId) {
//        List<MessageType> messageTypeList = null;
//        try {
//            messageTypeList = messageService.getMessageTypeByBigMessageTypeId(bigMessageTypeId);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return messageTypeList;
//    }

//    private boolean haveXianArray(Message message, String [] xianArray) {
//        for(int i = 0; i < xianArray.length; i++) {
//            if(message.getXian().indexOf(xianArray[i]) == -1){
//                return false;
//            }
//        }
//        return true;
//    }

    @RequestMapping(value="/getMessageByPage", method = RequestMethod.GET)
    @ResponseBody
    public ResultPage<Message> getMessageByPage(HttpServletRequest request) {
        Pager pager = new Pager();
        List<Message> messageList = null;
        ResultPage<Message> resultPage = null;
        HashMap<String, Object> paramMap = RequestUtil.getRequestParam(request);
        if (paramMap.get("page") != null) {
            pager.setCurrentPage(Integer.parseInt(paramMap.get("page").toString()));
        }
        paramMap.put("page", pager);
        try {
            messageList = messageService.getMessageByPage(paramMap);
            resultPage = new ResultPage<Message>(pager, messageList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultPage;
    }

    /**
     * 删除信息
     * @param id
     * @return
     */
    @RequestMapping(value="/deleteMessage", method = RequestMethod.POST)
    @ResponseBody
    public ResultMsg deleteMessage(@RequestParam("id") Integer id) {
        try {
            messageService.deleteMessage(id);
            return new ResultMsg(0, "删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultMsg(1, "删除失败");
        }
    }

    @RequestMapping(value="/getUnreadMessageNum", method = RequestMethod.POST)
    @ResponseBody
    public Integer getUnreadMessageNum(HttpServletRequest request) {
        HashMap<String, Object> param = RequestUtil.getRequestParam(request);
        Integer num = null;
        try {
            num = messageService.getUnreadMessageNum(param);
            return num;
        } catch (Exception e) {
            e.printStackTrace();
            return num;
        }
    }
}
