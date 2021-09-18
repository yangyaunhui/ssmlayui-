package com.xiexin.controller;

import com.xiexin.bean.TBusiness;
import com.xiexin.service.TBusinessService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class TbusinessController {
    @Autowired
    private TBusinessService tBusinessService;

    @RequestMapping("/selectTwoTable")
    @ResponseBody //没有这个注解不返回给前端json数据
    public Map selectTwoTable() {
        List<Map> maps = tBusinessService.selectTwoTable();
        Map codeMap = new HashMap();
        codeMap.put("code",0);
        codeMap.put("data",maps);
        return codeMap;
    }

    //增加
    @RequestMapping("/insert")
    @ResponseBody
    public Map insert(TBusiness tBusiness){
        Map codeMap = new HashMap();
        int i = tBusinessService.insertSelective(tBusiness);
       if (i==1){
           codeMap.put("code",0);
           codeMap.put("msg","添加成功");
       }else {
           codeMap.put("code",400);
           codeMap.put("msg","添加失败");
       }
       return codeMap;
    }

}
