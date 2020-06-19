package com.gemini.design.rmms.entity;

import lombok.Getter;
import lombok.Setter;

public class PlanUser {
    @Getter @Setter
    private String p_id;
    @Getter @Setter
    private String u_id;
    @Getter @Setter
    private Boolean pu_isadmin;
}
