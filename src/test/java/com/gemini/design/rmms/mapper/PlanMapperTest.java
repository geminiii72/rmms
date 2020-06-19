package com.gemini.design.rmms.mapper;

import com.gemini.design.rmms.entity.Plan;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;

import static org.junit.jupiter.api.Assertions.*;

class PlanMapperTest {
    @Autowired
    PlanMapper planMapper;

    @Test
    void getPlan() {
        Date d = new Date();
        System.out.println(d.getTime());
    }
}