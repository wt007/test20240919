package ${package.Entity};

<#list table.importPackages as pkg>
import ${pkg};
</#list>
<#if entityLombokModel>
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Builder;
<#if chainModel>
import lombok.experimental.Accessors;
</#if>
</#if>
import com.baomidou.mybatisplus.annotation.KeySequence;

/**
* @description: ${table.comment!} 实体类

* @author:  ${author}
* @create:  ${date}
*/
<#if entityLombokModel>
@Data
@Builder
<#if superEntityClass??>
@EqualsAndHashCode(callSuper = true)
<#else>
@EqualsAndHashCode(callSuper = false)
</#if>
<#if chainModel>
@Accessors(chain = true)
</#if>
</#if>
<#if table.convert>
@TableName("${table.name}")
</#if>
@KeySequence(value="SEQ_${table.name?upper_case}", clazz = Integer.class)
<#if superEntityClass??>
public class ${entity} extends ${superEntityClass}<#if activeRecord><${entity}></#if> {
<#elseif activeRecord>
public class ${entity} extends Model<${entity}> {
<#else>
public class ${entity} implements Serializable {
</#if>

<#if entitySerialVersionUID>
    private static final long serialVersionUID = 1L;
</#if>
<#-- ----------  BEGIN 字段循环遍历  ---------->
<#list table.fields as field>
<#if field.keyFlag>
    <#assign keyPropertyName="${field.propertyName}"/>
</#if>

    /**
    * ${field.comment}
    */
<#if field.comment!?length gt 0>

</#if>
<#if field.keyFlag>
<#-- 主键 -->
    <#if field.keyIdentityFlag && idType??>
    @TableId(value = "${field.annotationColumnName}", type = IdType.${idType})
    <#elseif field.keyIdentityFlag>
    @TableId(value = "${field.annotationColumnName}", type = IdType.AUTO)
    <#elseif field.convert>
    @TableId("${field.annotationColumnName}")
    </#if>
<#-- 普通字段 -->
<#elseif field.fill??>
<#-- -----   存在字段填充设置   ----->
    <#if field.convert>
    @TableField(value = "${field.annotationColumnName}", fill = FieldFill.${field.fill})
    <#else>
    @TableField(fill = FieldFill.${field.fill})
    </#if>
<#elseif field.convert>
    @TableField("${field.annotationColumnName}")
</#if>
<#-- 乐观锁注解 -->
    <#if (versionFieldName!"") == field.name>
    @Version
    </#if>
<#-- 逻辑删除注解 -->
    <#if (logicDeleteFieldName!"") == field.name>
    @TableLogic
    </#if>
    private ${field.propertyType} ${field.propertyName};
</#list>
<#------------  END 字段循环遍历  ---------->

<#if !entityLombokModel>
<#list table.fields as field>
    <#if field.propertyType == "boolean">
        <#assign getprefix="is"/>
    <#else>
        <#assign getprefix="get"/>
    </#if>
    public ${field.propertyType} ${getprefix}${field.capitalName}() {
    return ${field.propertyName};
    }

    <#if chainModel>
        public ${entity} set${field.capitalName}(${field.propertyType} ${field.propertyName}) {
    <#else>
        public void set${field.capitalName}(${field.propertyType} ${field.propertyName}) {
    </#if>
    this.${field.propertyName} = ${field.propertyName};
    <#if chainModel>
        return this;
    </#if>
    }
</#list>
</#if>

<#if entityColumnConstant>
<#list table.fields as field>
    public static final String ${field.name?upper_case} = "${field.name}";

</#list>
</#if>
<#if activeRecord>
    @Override
    protected Serializable pkVal() {
    <#if keyPropertyName??>
        return this.${keyPropertyName};
    <#else>
        return null;
    </#if>
    }

</#if>
<#if !entityLombokModel>
    @Override
    public String toString() {
    return "${entity}{" +
    <#list table.fields as field>
        <#if field_index==0>
            "${field.propertyName}=" + ${field.propertyName} +
        <#else>
            ", ${field.propertyName}=" + ${field.propertyName} +
        </#if>
    </#list>
    "}";
    }
</#if>
}