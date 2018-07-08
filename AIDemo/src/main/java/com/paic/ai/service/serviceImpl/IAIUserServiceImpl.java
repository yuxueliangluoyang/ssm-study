package com.paic.ai.service.serviceImpl;

import java.util.List;
import java.util.Map;

import javax.xml.rpc.ServiceException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.paic.ai.dao.AiUserMapper;
import com.paic.ai.dto.AiUser;
import com.paic.ai.service.IAIUserService;

@Service("IAIUserService")
public class IAIUserServiceImpl implements IAIUserService{

    @Autowired
    private AiUserMapper aiUserMapper;
    
    public AiUser selectByPrimaryKey(Integer id) throws ServiceException {
        return aiUserMapper.selectByPrimaryKey(id);
    }

    @Override
    public AiUser selectByUserName(String accountNo) throws ServiceException {
        return aiUserMapper.selectByUserName(accountNo);
    }

    @Override
    public List<AiUser> selectAll() throws ServiceException {
        return aiUserMapper.selectAll();
    }

    @Override
    public List<AiUser> queryUserList(Map<String, Object> paramMap) throws ServiceException {
        // TODO Auto-generated method stub
        return aiUserMapper.queryUserList(paramMap);
    }

}
