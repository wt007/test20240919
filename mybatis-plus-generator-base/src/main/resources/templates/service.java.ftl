package ${package.Service};

import ${package.Entity}.${entity};
import ${superServiceClassPackage};
import java.util.List;
import com.baomidou.mybatisplus.core.metadata.IPage;

/**
* @description: ${table.comment!} 服务类
*
* @author:  ${author}
* @create:  ${date}
*/
<#if kotlin>
interface ${table.serviceName} : ${superServiceClass}<${entity}>
<#else>
public interface ${table.serviceName} extends ${superServiceClass}<${entity}> {

    IPage<${entity}> listByPage(long current, long pageSize);

}
</#if>
