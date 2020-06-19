package com.gemini.design.rmms.service;


import com.gemini.design.rmms.entity.Plan;
import com.gemini.design.rmms.entity.PlanUser;
import com.gemini.design.rmms.entity.User;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

public interface PlanService {

    public Plan getPlan(String p_id);

    public List<Map> findSelfPlans(String u_id);

    public List<String> getPlanList(String u_id);

    public List<User> getUserInfo(String p_id);

    public List<Plan> getAllPlan();

    public Boolean deletePlan(List list);

    public int insertPlan(Plan plan);

    public int getFinalId();

    public int insertPlanUser(List<PlanUser> planUsers);
}
