package com.azimiao.crud.service;

import java.util.List;import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.azimiao.crud.bean.information;
import com.azimiao.crud.bean.informationExample;
import com.azimiao.crud.bean.informationExample.Criteria;
import com.azimiao.crud.dao.informationMapper;

@Service
public class informationService {
	
	@Autowired
	informationMapper informationMapper;
	
	public List<information> getoneinfomationWithuuid(String uuid){
		informationExample example = new informationExample();
		Criteria criteria = example.createCriteria();
		criteria.andUuidEqualTo(uuid);
		List<information> ls=informationMapper.selectByExample(example);
		return ls;
	}

	public void updateInfo(information information) {
		informationMapper.updateByUUIDSelective(information);
	}
}
