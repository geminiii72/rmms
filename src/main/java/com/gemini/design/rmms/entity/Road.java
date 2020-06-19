package com.gemini.design.rmms.entity;

import lombok.Getter;
import lombok.Setter;

public class Road {
    @Getter @Setter
    private String r_id;
    @Getter @Setter
    private String r_name;
    @Getter @Setter
    private String r_type;
    @Getter @Setter
    private String u_id;
    @Getter @Setter
    private double r_x;
    @Getter @Setter
    private double r_y;
    @Getter @Setter
    private double r_length;
    @Getter @Setter
    private double r_width;
    @Getter @Setter
    private String r_date;
    @Getter @Setter
    private String r_state;
    @Getter @Setter
    private String r_note;
    @Getter @Setter
    private String r_m_type;
    @Getter @Setter
    private double r_m_length;
    @Getter @Setter
    private double r_m_width;
    @Getter @Setter
    private double r_m_density;
    @Getter @Setter
    private int r_m_grade;

}
