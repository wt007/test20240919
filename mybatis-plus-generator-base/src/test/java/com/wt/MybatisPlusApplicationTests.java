package com.wt;

import com.wt.sample.MyBatisPlusGenerator;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Arrays;
import java.util.List;

@SpringBootTest
class MybatisPlusApplicationTests {

    @Autowired
    MyBatisPlusGenerator myBatisPlusGenerator;

    /**
     * 代码生成
     */
    @Test
    void contextLoads() {
        myBatisPlusGenerator.codeGenerator();
        System.out.println("代码生成成功！！");
    }

    @Test
    void contextLoads1() {
        System.out.println("iiiiiii");

        List<String> list = Arrays.asList("apple", "banana", "cherry");
        String join ="'"+ String.join("','", list) + "'";
        System.out.println(join);
    }



}
