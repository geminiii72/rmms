package com.gemini.design.rmms.entity;

import lombok.Getter;
import lombok.Setter;

public class Tool {
    @Getter @Setter
    private String t_id;
    @Getter @Setter
    private String t_name;
    @Getter @Setter
    private String t_type;
    @Getter @Setter
    private String t_note;
    @Getter @Setter
    private String w_place;//存放仓库
    @Getter @Setter
    private String w_id;
    @Getter @Setter
    private String tr_num;//数量

}
