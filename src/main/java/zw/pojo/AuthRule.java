package zw.pojo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class AuthRule implements Serializable {
    private static final Long serialVersionUID=1L;
    private String id;
    private String title;
    private String pid;
    private String ruleVal;
    private Long updateTime;
    private Long deleteTime;

    private List<AuthRule> children = new ArrayList<AuthRule>();

    public void addChildrenAll(List<AuthRule> authRuleList){
        this.children=authRuleList;
    }
    public void addChildren(AuthRule authRule){
        this.children.add(authRule);
    }
    public void removeChildren(AuthRule authRule){
        this.children.remove(authRule);
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getRuleVal() {
        return ruleVal;
    }

    public void setRuleVal(String ruleVal) {
        this.ruleVal = ruleVal;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public Long getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Long updateTime) {
        this.updateTime = updateTime;
    }

    public Long getDeleteTime() {
        return deleteTime;
    }

    public void setDeleteTime(Long deleteTime) {
        this.deleteTime = deleteTime;
    }

    public List<AuthRule> getChildren() {
        return children;
    }

    public void setChildren(List<AuthRule> children) {
        this.children = children;
    }
}
