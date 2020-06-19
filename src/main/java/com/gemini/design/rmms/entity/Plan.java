package com.gemini.design.rmms.entity;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
public class Plan {
    @Getter @Setter
    private String p_id;
    @Getter @Setter
    private String p_type;
    @Getter @Setter
    private String p_date;
    @Getter @Setter
    private String p_c_date;
    @Getter @Setter
    private String p_note;
    @Getter @Setter
    private String p_state;
    @Getter @Setter
    private String r_id;
    @Getter @Setter
    private String r_name;//对应道路名称
    @Getter @Setter
    private String u_id;
    @Getter @Setter
    private String u_name;//负责姓名
    @Getter @Setter
    private String pg_id;
}
