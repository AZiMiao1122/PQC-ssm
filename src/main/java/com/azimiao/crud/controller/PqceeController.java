package com.azimiao.crud.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.azimiao.crud.bean.Msg;
import com.azimiao.crud.bean.information;
import com.azimiao.crud.bean.product;
import com.azimiao.crud.dao.productMapper;
import com.azimiao.crud.service.PqceeService;
import com.azimiao.crud.service.informationService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
/**
 * 处理表单的CRUD请求
 * @author qiann
 *
 */
@Controller
public class PqceeController {
	/**
	 * ResponseBody是MVC的一个json包，直接返回json数据
	 * @return 
	 */
	//跳转页面
	@RequestMapping("/pqcmanagementwithadmin.doingsomething")
	public String tiaozhuan(){
		return "pqcmanagement";
	}
	
	//自动注入
	@Autowired
	PqceeService pqceeService;
	
	@Autowired
	informationService informationservice;
	
	
	
	
	/**
	 * 更新product
	 * @param product
	 * @return
	 */
	@RequestMapping(value="/updateproduct/{proId}",method=RequestMethod.PUT)
	@ResponseBody
	public Msg updateproduct(product product){
		pqceeService.updatePro(product);
		return Msg.success();
	}
	
	
	
	/**
	 * 更新info
	 * @param information
	 * @return
	 */
	@RequestMapping(value="/updateinfo/{uuid}",method=RequestMethod.PUT)
	@ResponseBody
	public Msg saveinfo(information information){
		//System.out.println(information);
		informationservice.updateInfo(information);
		return Msg.success();
	}
	
	
	
	
	
	
	
	/**
	 * 获取一列infomation
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/getoneinfomation/{id}",method=RequestMethod.GET)
	@ResponseBody
	public information getoneinformation(@PathVariable("id")Integer id){
		information inf=pqceeService.getoneinfomation(id);
		return inf;
	}
	
	/**
	 * 获取一列infomation
	 * @param uuid
	 * @return
	 */
	@RequestMapping(value="/getoneinfomationwithuuid/{uuid}",method=RequestMethod.GET)
	@ResponseBody
	public List<information> getoneinformationWithuuid(@PathVariable("uuid")String uuid){
		List<information> inf=informationservice.getoneinfomationWithuuid(uuid);
		return inf;
	}
	
	
	
	/**
	 * 获取id为pro_id的list集合
	 * @param proUuid
	 * @return
	 */
	@RequestMapping(value="/getoneproduct/{proUuid}",method=RequestMethod.GET)
	@ResponseBody
	public List<product> getoneproduct(@PathVariable("proUuid")String proUuid){
		List<product> pd = pqceeService.getoneproducts(proUuid);
		return pd;
	}
	
	/**
	 * 保存种类
	 * @param product
	 * @return
	 */
	@RequestMapping(value="/saveproducts",method=RequestMethod.POST)
	@ResponseBody
	public Msg saveproduct(product product){
		pqceeService.savepro(product);
		return Msg.success();
	}
	
	
	
	
	/**
	 * 获取编号(获取一列数据)
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/pqcsinfos/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getPqcID(@PathVariable("id")Integer id){
	information	inf= pqceeService.getinfoid(id);
	return Msg.success().add("pqc", inf);
	}
	
	
	

	

	
	//获取分页
	@RequestMapping("/getpagelist")
	@ResponseBody
	public Msg getPgesList(@RequestParam(value="pn",defaultValue="1")Integer pn){
		PageHelper.startPage(pn, 10);
		List<information> list= pqceeService.getAll();
		PageInfo page=new PageInfo(list,10);
		return Msg.success().add("pageInfo",page);
	}
	
	/**
	 * 保存
	 * @param information
	 * @return
	 */
	@RequestMapping(value="/pqcsaves",method=RequestMethod.POST)
	@ResponseBody
	public Msg savePqc(information information){
		pqceeService.savePqc(information);
		return Msg.success();
	}

}
