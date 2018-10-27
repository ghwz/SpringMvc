package zw.pojo;

import java.io.Serializable;

public class AuthAccess implements Serializable {
    private static final Long serialVersionUID=1L;
    private Long roleId;
    private Long ruleId;

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    public Long getRuleId() {
        return ruleId;
    }

    public void setRuleId(Long ruleId) {
        this.ruleId = ruleId;
    }
}
