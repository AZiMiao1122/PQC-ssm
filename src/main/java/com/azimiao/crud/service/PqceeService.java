package com.azimiao.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.azimiao.crud.bean.information;
import com.azimiao.crud.bean.informationExample;
import com.azimiao.crud.bean.product;
import com.azimiao.crud.bean.productExample;
import com.azimiao.crud.bean.productExample.Criteria;
import com.azimiao.crud.dao.informationMapper;
import com.azimiao.crud.dao.productMapper;


@Service
public class PqceeService {
	
	@Autowired
	informationMapper informationMapper;
	@Autowired
	productMapper productmapper;
	
	/**
	 * 查询所有数据
	 
	
	public List<pqcee> getAll(){
		return pqceeMapper.selectByExample(null);
	}
	
	
	//需要传什么就传递什么参数
	public pqcee getOneList(Integer id){
		return  pqceeMapper.selectByPrimaryKey(id);
	}
	
	*/
	
	/**
	 * 保存表单的方法
	 * @param information
	 * @return 
	 */
	public information savePqc(information information){
		informationMapper.insertSelective(information);
		return information;
	}
	
	
	
	
	//请求一列info和pro
	
	
	//请求全部数据
	public List<information> getAll(){
		return informationMapper.selectByExample(null);
	}



	/**
	 * 根据ID查询基础表
	 * @param id
	 * @return
	 */
	public information getinfoid(Integer id) {
		// TODO Auto-generated method stub
		information info = informationMapper.selectByPrimaryKey(id);
		return info;
	}



	/**
	 * 产品种类保存方法
	 * @param product
	 */
	public void savepro(product product) {
		// TODO Auto-generated method stub
		productmapper.insertSelective(product);
	}




	




	public information getoneinfomation(Integer id) {
		// TODO Auto-generated method stub
		information info=informationMapper.selectByPrimaryKey(id);
		return info;
	}




	public List<product> getoneproducts(String proUuid) {
		productExample example = new productExample();
		Criteria criteria = example.createCriteria();
		criteria.andProUuidEqualTo(proUuid);
		List<product> ls=productmapper.selectByExample(example);
		return ls;
	}




	public void updatePro(product product) {
		// TODO Auto-generated method stub
		productmapper.updateByPrimaryKeySelective(product);
	}




	public void deleteInfomation(Integer id) {
		informationMapper.deleteByPrimaryKey(id);
		
	}




	




	
	
}
