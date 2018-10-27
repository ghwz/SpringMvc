package zw.dao;

import zw.pojo.AuthAccess;
import zw.pojo.AuthRule;

import java.util.List;

public interface AuthRuleDao {
    /**
     * 根据权限查找菜单
     * @param rule_ids
     * @return
     */
    List<AuthRule> getLevelData(List<AuthAccess> rule_ids);
}
