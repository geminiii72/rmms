package com.gemini.design.rmms.mapper;

import com.gemini.design.rmms.entity.Plan;
import com.gemini.design.rmms.entity.PlanUser;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface PlanMapper {

    /* 根据项目p_id获取指定plan信息 */
    public Plan getPlan(String p_id);

    /* 根据一组项目ID查找项目信息 */
    public List<Plan> getPlanForList(@Param("plans") List plans);

    /* 根据用户ID获取该用户的项目ID */
    public List<PlanUser> getPlanUser(String u_id);

    /* 获取所有项目数据 */
    public List<Plan> getAllPlan();

    /* 删除列表内iD的信息 */
    public int deletePlan (List list);

    /* 添加计划 */
    public int insertPlan(Plan plan);

    /* 获取最新添加的计划ID */
    public String getFinalId();

    /* 添加计划用户联系表 */
    public int insertPlanUser(@Param("list")List<PlanUser> list);
}
