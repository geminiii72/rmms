package com.gemini.design.rmms.service.Impl;

import com.gemini.design.rmms.entity.Plan;
import com.gemini.design.rmms.entity.PlanUser;
import com.gemini.design.rmms.entity.User;
import com.gemini.design.rmms.mapper.PlanMapper;
import com.gemini.design.rmms.mapper.UserMapper;
import com.gemini.design.rmms.service.PlanService;
import com.gemini.design.rmms.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.swing.text.html.parser.Parser;
import java.util.*;

@Service
public class PlanServiceImpl implements PlanService
{
    @Autowired
    private PlanMapper planMapper;
    @Autowired
    private UserMapper userMapper;

    /* 根据项目id获取项目数据 */
    @Override
    public Plan getPlan(String p_id) {
        return planMapper.getPlan(p_id);
    }

    /*  根据用户ID查找用户所在的项目的数据 */
    @Override
    public List<Map> findSelfPlans(String u_id) {
        //查找项目用户表，获取含有该用户的项目ID表
        List<PlanUser> planUsers = planMapper.getPlanUser(u_id);

        //获取表中所有的项目id
        Iterator iPlanUsers = planUsers.iterator();
        List list = new ArrayList();
        while (iPlanUsers.hasNext()) {
            PlanUser pu = (PlanUser) iPlanUsers.next();
            list.add(pu.getP_id());
        }


        try {
            //根据一组项目ID查找数据
            List<Plan> plans = planMapper.getPlanForList(list);

            //迭代器保存数据
            List<Map> result = new ArrayList<Map>();//<是否为负责人, 项目>
            iPlanUsers = planUsers.iterator();
            Iterator iPlan = plans.iterator();
            while (iPlanUsers.hasNext() && iPlan.hasNext()) {
                Plan plan = (Plan) iPlan.next();//计划
                PlanUser planUser = (PlanUser) iPlanUsers.next();//计划用户表(包含是否为负责人)

                Map<String, Object> item = new HashMap<String, Object>();
                item.put("isadmin", planUser.getPu_isadmin());//存放是否为负责人
                item.put("plan", plan);//存放计划

                result.add(item);

                return result;
            }
        }catch (Exception e) {
            System.out.println("发生了错误:" + e);
        }

        return null;
    }

    /*
     * 根据指定用户ID获取该用户下的Plan列表
     * @Return PlanID列表
     */
    @Override
    public List<String> getPlanList(String u_id) {
        List<String> list = new ArrayList<String>();//PlanId列表
        List<PlanUser> plans = planMapper.getPlanUser(u_id);//查询到的PlanUser--(planId, userId, isAdmin)

        Iterator iterator = plans.iterator();
        while (iterator.hasNext()) {//迭代PlanUser，提取PlanId
            PlanUser planUser = (PlanUser) iterator.next();
            list.add(planUser.getP_id());
        }

        return list;
    }

    /*
     * 根据计划ID获取该计划的参与人员
     * @Param 计划的ID
     * @Return 参与人员
     */
    @Override
    public List<User> getUserInfo(String p_id) {
        List<User> list = userMapper.getUserForPlan(p_id);

        return list;
    }

    /* 获取所有的项目信息 */
    @Override
    public List<Plan> getAllPlan() {
        return planMapper.getAllPlan();
    }

    /* 删除列表内ID的信息 */
    @Override
    public Boolean deletePlan(List list) {
        if (planMapper.deletePlan(list) > 0) {
            return true;
        }

        return false;
    }

    /* 添加计划 */
    @Override
    public int insertPlan(Plan plan) {
        return planMapper.insertPlan(plan);
    }

    /* 获取最新添加的计划ID */
    @Override
    public int getFinalId() {
        int id = Integer.valueOf(planMapper.getFinalId()).intValue();
        return id;
    }

    /* 添加计划用户联系表 */
    @Override
    public int insertPlanUser(List<PlanUser> planUsers) {
        return planMapper.insertPlanUser(planUsers);
    }
}
