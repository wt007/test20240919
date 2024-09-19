package com.wt.sample;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author wt
 * @since 2022-03-17
 */
@RestController
@RequestMapping("/code")
public class CodeBuildController {

    @Autowired
    MyBatisPlusGenerator myBatisPlusGenerator;

    @GetMapping("/build")
    public Map getAll(){
        Map resultMap = new HashMap();
        myBatisPlusGenerator.codeGenerator();
        resultMap.put("status","200");
        return  resultMap;
    }

}
