package zw.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import zw.dao.AuthRuleDao;
import zw.pojo.AuthAccess;
import zw.pojo.AuthRule;
import zw.service.AuthRuleService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("authRuleService")
public class AuthRuleServiceImpl implements AuthRuleService {
    @Autowired
    private AuthRuleDao authRuleDao;
    public List<AuthRule> getLevelData(List<AuthAccess> auth_access_ids) {
        List<AuthRule> list= authRuleDao.getLevelData(auth_access_ids);
        Map<String,List<AuthRule>> mapList=getMapChildrenNode(list);
        List<AuthRule > nodeList =getRootNode(mapList,"0");

        return nodeList;
    }


    /**
     * 获取根节点
     * @param map 集合
     * @param rootId 根节点
     * @return
     */
    private List<AuthRule> getRootNode(Map<String,List<AuthRule>> map,String rootId){
        List<AuthRule> returnNodeList=new ArrayList<AuthRule>();
        List<AuthRule> rootNodeList=map.get(rootId);//根节点树
        for (AuthRule authRule:rootNodeList){
            List<AuthRule> childrenNodeList=map.get(authRule.getId());
            if(childrenNodeList!=null){
                List<AuthRule> returnSubNodeList=new ArrayList<AuthRule>();
                for (AuthRule childrenAuthRule:childrenNodeList){
                    if(map.get(childrenAuthRule.getId())!=null){
                        childrenAuthRule.addChildrenAll(getRootNode(map,childrenAuthRule.getId()));
                    }
                    returnSubNodeList.add(childrenAuthRule);
                }
                authRule.addChildrenAll(returnSubNodeList);
            }
            returnNodeList.add(authRule);
        }
        return returnNodeList;
    }

    /**
     * 获取所有子节点 <k,v>父节点，子节点集合</k,v>
     * @param list
     * @return
     */
    private Map<String,List<AuthRule>> getMapChildrenNode(List<AuthRule> list){
        Map<String,List<AuthRule>> map=new HashMap<String,List<AuthRule>>();
        for (AuthRule authRule:list){
            List<AuthRule> listAuthRule=map.get(authRule.getPid());
            if(listAuthRule==null){
                listAuthRule=new ArrayList<AuthRule>();
            }
            listAuthRule.add(authRule);
            map.put(authRule.getPid(),listAuthRule);
        }
        return map;
    }


}
