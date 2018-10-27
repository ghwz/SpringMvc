package zw.service;

import zw.pojo.AuthAccess;
import zw.pojo.AuthRule;

import java.util.List;

public interface AuthRuleService {
    List<AuthRule> getLevelData(List<AuthAccess> auth_access_ids );
}
