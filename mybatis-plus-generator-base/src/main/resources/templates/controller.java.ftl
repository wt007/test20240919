package ${package.Controller};

import ${package.Entity}.${entity};
import ${package.Service}.${table.serviceName};
import com.baomidou.mybatisplus.core.metadata.IPage;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
<#if restControllerStyle>
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
<#else>
import org.springframework.stereotype.Controller;
</#if>
<#if superControllerClassPackage??>
import ${superControllerClassPackage};
</#if>

/**
* @description: ${table.comment!} 控制层
*
* @author:  ${author}
* @create:  ${date}
*/
<#if restControllerStyle>
@RestController
<#else>
@Controller
</#if>
@RequestMapping("<#if package.ModuleName?? && package.ModuleName != "">/rasserv/${package.ModuleName}</#if>")
<#if kotlin>
class ${table.controllerName}<#if superControllerClass??> : ${superControllerClass}()</#if>
<#else>
<#if superControllerClass??>
public class ${table.controllerName} extends ${superControllerClass} {
<#else>
public class ${table.controllerName} {
</#if>

    @Autowired
    private ${table.serviceName} ${table.serviceName?lower_case};

    /**
    * ${table.comment}列表查询
    * @return
    */
    <#if restControllerStyle>
    @GetMapping("/list")
    </#if>
    public List<${entity}> list(){
        return ${table.serviceName?lower_case}.list();
    }

    /**
    * ${table.comment}详情查询
    * @return
    */
    <#if restControllerStyle>
    @GetMapping("/get")
    </#if>
    public ${entity} get(String id){
        return ${table.serviceName?lower_case}.getById(id);
    }

    /**
    * ${table.comment}分页列表查询
    * @return
    */
    <#if restControllerStyle>
    @GetMapping("/listByPage")
    </#if>
    public IPage<${entity}> listByPage(long current,long pageSize){
        return ${table.serviceName?lower_case}.listByPage(current,pageSize);
    }


    /**
    * ${table.comment}保存
    * @return
    */
    <#if restControllerStyle>
    @PostMapping("/save")
    </#if>
    public void save(${entity} ${entity?lower_case}){
        ${table.serviceName?lower_case}.save(${entity?lower_case});
    }

    /**
    * ${table.comment}删除
    * @return
    */
    <#if restControllerStyle>
    @DeleteMapping("/delete")
    </#if>
    public void delete(String id){
        ${table.serviceName?lower_case}.removeById(id);
    }
}
</#if>