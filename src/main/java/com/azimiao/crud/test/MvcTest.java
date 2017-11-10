package com.azimiao.crud.test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.azimiao.crud.bean.information;
import com.azimiao.crud.dao.informationMapper;
import com.github.pagehelper.PageInfo;



@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations={"classpath:applicationContext.xml","file:src/main/webapp/WEB-INF/dispatcherServlet-servlet.xml"})
public class MvcTest {
	
	//传入Springmvc的Ioc
	@Autowired
	WebApplicationContext context;
	//虚拟mvc请求，获取到处理结果
	MockMvc mockMvc;
	
	@Before
	public void initMokcMvc(){
		
		mockMvc =MockMvcBuilders.webAppContextSetup(context).build();
	}
	@Test
	public void testPage() throws Exception{
		MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/index2").param("id", "1")).andReturn();
		
		MockHttpServletRequest request = result.getRequest();
		
		
	}
	
	
	
}
                      