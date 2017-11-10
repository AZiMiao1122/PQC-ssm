package com.azimiao.crud.test;

import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.azimiao.crud.bean.information;
import com.azimiao.crud.dao.informationMapper;





//测试dao层的工作
/**
 * 测试DepartmentMapper
 * 
 * 推荐:Spring的项目使用Spring的单元测试，可以自动注入我们需要的组件
 * 1.导入SpringTest模块
 * 2.@ContextConfiguration指定Spring配置文件的位置
 * 直接autowired要使用的组件即可
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class MapperTest {
	
	
	@Autowired
	informationMapper informationmapper;
	
	@Autowired
	SqlSession sqlSession;
	
	public void testuuid(){
		ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
		ioc.getBean(informationMapper.class);
		//informationmapper.updateByExample(("甘",null), "93AD0962C46F901DE5B6F607A7409E62");
	}
	/**
	@Test
	public void testCRUD(){
		/**
		//1.创建SpringIOC容器
		ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
		//2.从容器 中获取mapper
		ioc.getBean(DepartmentMapper.class);
		
		System.out.println(pqMapper);
		
		//1.插入几个部门
//		new Department();
//		DepartmentMapper.insertSelective(new Department(null,"开发部"));
//		DepartmentMapper.insertSelective(new Department(null,"测试部"));
		
		//2.生成员工数据 测试员工插入
		//employeeMapper.insertSelective(new Employee(null,"jerry","M","154@qq.com",3));
		
		//3.批量插入多个员工：批量，使用可以执行批量操作的sqlsession
//		 for(){
//		employeeMapper.insertSelective(new Employee(null,"jerry","M","154@qq.com",3)); 
//		 }
		
	}
	*/
}
