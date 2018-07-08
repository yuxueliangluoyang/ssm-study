package com.paic.ai.service;

import java.util.List;
import java.util.Map;

import javax.xml.rpc.ServiceException;

import com.paic.ai.dto.AiUser;

public interface IAIUserService {

    AiUser selectByPrimaryKey(Integer id) throws ServiceException;

    AiUser selectByUserName(String accountNo) throws ServiceException;

    List<AiUser> selectAll() throws ServiceException;

    List<AiUser> queryUserList(Map<String, Object> paramMap) throws ServiceException;
}
