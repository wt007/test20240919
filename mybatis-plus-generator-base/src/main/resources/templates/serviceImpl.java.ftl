package ${package.ServiceImpl};

import ${package.Entity}.${entity};
import ${package.Mapper}.${table.mapperName};
import ${package.Service}.${table.serviceName};
import ${superServiceImplClassPackage};
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import java.util.List;


/**
* @description: ${table.comment!} 服务实现类
*
* @author:  ${author}
* @create:  ${date}
*/
@Service
<#if kotlin>
open class ${table.serviceImplName} : ${superServiceImplClass}<${table.mapperName}, ${entity}>(), ${table.serviceName} {

}
<#else>
public class ${table.serviceImplName} extends ${superServiceImplClass}<${table.mapperName}, ${entity}> implements ${table.serviceName} {

    @Autowired
    private ${table.mapperName} ${table.mapperName?lower_case};

    @Override
    public IPage<${entity}> listByPage(long current, long pageSize){
        //参数一是当前页，参数二是每页个数
        IPage<${entity}> ${entity?lower_case}PageList = new Page<>(current, pageSize);
        ${entity?lower_case}PageList = ${table.mapperName?lower_case}.selectPage(${entity?lower_case}PageList, null);
        List<${entity}> list = ${entity?lower_case}PageList.getRecords();
        return ${entity?lower_case}PageList;
    }

}
</#if>
