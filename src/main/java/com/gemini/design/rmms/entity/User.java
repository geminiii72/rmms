package com.gemini.design.rmms.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
public class User {
    @Getter @Setter
    private String u_id;
    @Getter @Setter
    private String u_name;
    @Getter @Setter
    private String u_pwd;
    @Getter @Setter
    private String u_type;
    @Getter @Setter
    private String u_class;
    @Getter @Setter
    private String u_phone;
    @Getter @Setter
    private Boolean pu_isadmin;

    /* 交换电话号码和id的值，用于判断电话和id查找 */
    public void exchangPhoneAdndId() {
        String s = this.u_id;
        this.u_id = this.u_phone;
        this.u_phone = s;
    }

}
