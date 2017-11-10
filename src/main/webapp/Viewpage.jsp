<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>表单查看</title>
<style>
.size{
	font-size:14px;
	}
.d{ float:right;
    margin:0 auto;}
.hlong *{display:inline-block;
         vertical-align:middle
		 }
.a{ font-size:40px;}
.a1{ border-top:0px; border-bottom:0px;}
.table{border:1px solid #000} 
/* css注释：只对table标签设置黑色边框样式 */ 
</style>
<!-- 引入jquery -->
<script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">

//获取头连接
function GetQueryString(name)
{
     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
     var r = window.location.search.substr(1).match(reg);
     if(r!=null)return  unescape(r[2]); return null;
}

$(function(){
	$.ajax({
		url:"${APP_PATH}/getoneinfomationwithuuid/"+GetQueryString("uuid"),
		type:"GET",
		async:false,
		success:function(info){
				//如果为null字符串， 将其转换为空格
				for(var i in info[0]){
					if(info[0][i]==null)
						info[0][i]=" ";
				}
				//签证日期转换
				var Date = info[0].date;
				var yeartxt = Date.substring(0,4);
				var monthtxt = Date.substring(5,7);
				var daytxt = Date.substring(8,10);
				
				var startDate = info[0].startdate;
				var y1 = NoToChinese(startDate.substring(0,1));
				var y2 = NoToChinese(startDate.substring(1,2));
				var y3 = NoToChinese(startDate.substring(2,3));
				var y4 = NoToChinese(startDate.substring(3,4));
				var startyear = y1+y2+y3+y4;
				var startmonth = NoToChinese(startDate.substring(5,7));
				var startday = NoToChinese(startDate.substring(8,10));
				
				var endDate = info[0].enddate;
				var y5 = NoToChinese(endDate.substring(0,1));
				var y6 = NoToChinese(endDate.substring(1,2));
				var y7 = NoToChinese(endDate.substring(2,3));
				var y8 = NoToChinese(endDate.substring(3,4));
				var endyear = y5+y6+y7+y8;
				var endmonth = NoToChinese(endDate.substring(5,7));
				var endday = NoToChinese(endDate.substring(8,10));
				
				
				
				
				
				
				$("#infoName").append(info[0].infoName).css("color","blue").css("font-weight","bold");
				$("#lin").append(info[0].lin).css("color","blue").css("font-weight","bold");
				$("#inspection").append(info[0].inspection).css("color","blue").css("font-weight","bold");
				$("#coLtdPersonAd").append(info[0].coLtdPersonAd).css("color","blue").css("font-weight","bold");
				$("#idNumber").append(info[0].idNumber).css("color","blue").css("font-weight","bold");
				$("#phoneNumber").append(info[0].phoneNumber).css("color","blue").css("font-weight","bold");
				$("#address").append(info[0].address).css("color","blue").css("font-weight","bold");
				$("#source").append(info[0].source).css("color","blue").css("font-weight","bold");
				$("#transportMachine").append(info[0].transportMachine).css("color","blue").css("font-weight","bold");
				$("#transportFrom").append("自     "+info[0].transportFrom+ "     经  "+ info[0].transportBy + "   至     " +info[0].transportTo).css("color","blue").css("font-weight","bold");
				$("#date").append("至 "+startyear+" 年 " + startmonth + " 月 " + startday+ " 日至 "+
						endyear + " 年 " + endmonth + " 月 " + endday +" 日"	).css("color","blue").css("font-weight","bold");
				$("#detail").append(info[0].detail).css("color","blue").css("font-weight","bold");
				//$("#my_date").append("签证日期 "+yeartxt+" 年 "+monthtxt+" 月 "+daytxt+" 日").css("color","blue").css("font-weight","bold");
				$("#isyear").append(yeartxt).css("color","blue").css("font-weight","bold");
				$("#ismonth").append(monthtxt).css("color","blue").css("font-weight","bold");
				$("#isday").append(daytxt).css("color","blue").css("font-weight","bold");
				//$("#my_date").append("签证日期 "+info.year +" 年 "+ info.month+" 月 " + info.day +"日");
				
				
				
				$.ajax({
					url:"${APP_PATH}/getoneproduct/"+GetQueryString("uuid"),
					type:"GET",
					async:false,
					success:function(pro){
						for(var i = 0;i < getJsonObjLength(pro);i++){
							var plantName = $("<td height=\"30\"></td>").append(pro[i].plantName).css("color","blue").css("font-weight","bold");
							var variety = $("<td height=\"30\"></td>").append(pro[i].variety).css("color","blue").css("font-weight","bold");
							var specification = $("<td height=\"30\"></td>").append(pro[i].specification).css("color","blue").css("font-weight","bold");
							var unit = $("<td height=\"30\"></td>").append(pro[i].unit).css("color","blue").css("font-weight","bold");
							var amount = $("<td height=\"30\"></td>").append(pro[i].amount).css("color","blue").css("font-weight","bold");
							var remark = $("<td height=\"30\"></td>").append(pro[i].remark).css("color","blue").css("font-weight","bold");
							$("<tr></tr>").append(plantName)
											.append(variety)
											.append(specification)
											.append(unit)
											.append(amount)
											.append(remark)
											.appendTo("#body");
									}
						var elet = 10 - getJsonObjLength(pro);
						for(var i = 0;i < elet ;i++){
							var td = $("<td height=\"30\"></td>");
							var td2 = $("<td height=\"30\"></td>");
							var td3 = $("<td height=\"30\"></td>");
							var td4 = $("<td height=\"30\"></td>");
							var td5 = $("<td height=\"30\"></td>");
							var td6 = $("<td height=\"30\"></td>");
							$("<tr></tr>").append(td)
							.append(td2)
							.append(td3)
							.append(td4)
							.append(td5)
							.append(td6)
							.appendTo("#body");
						}

							}
					});
			}
		});
	
	
});

//大写
function NoToChinese(num) { 
	if (!/^\d*(\.\d*)?$/.test(num)) { alert("Number is wrong!"); return "Number is wrong!"; } 
	if(num == 0)
		return "零";
	var AA = new Array("零", "壹", "贰", "叁", "肆", "伍", "陆", "柒", "捌", "玖"); 
	var BB = new Array("", "拾", "佰", "仟", "萬", "億", "点", ""); 
	var a = ("" + num).replace(/(^0*)/g, "").split("."), k = 0, re = ""; 
	for (var i = a[0].length - 1; i >= 0; i--) { 
	switch (k) { 
	case 0: re = BB[7] + re; break; 
	case 4: if (!new RegExp("0{4}\\d{" + (a[0].length - i - 1) + "}$").test(a[0])) 
	re = BB[4] + re; break; 
	case 8: re = BB[5] + re; BB[7] = BB[5]; k = 0; break; 
	} 
	if (k % 4 == 2 && a[0].charAt(i + 2) != 0 && a[0].charAt(i + 1) == 0) re = AA[0] + re; 
	if (a[0].charAt(i) != 0) re = AA[a[0].charAt(i)] + BB[k % 4] + re; k++; 
	} 

	if (a.length > 1) //加上小数部分(如果有小数部分) 
	{ 
	re += BB[6]; 
	for (var i = 0; i < a[1].length; i++) re += AA[a[1].charAt(i)]; 
	} 
	return re; 
	}
	
//json计数器
function getJsonObjLength(jsonObj) {
        var Length = 0;
		//获取product长度
        for (var item in jsonObj) {
            Length++;
        }
        return Length;
}
</script>
</head>
<body>
	<form>
<table align="center" border="0"
width="770" height="1000" cellspacing="0" cellpadding="0">
  <tr> <!-- 1行1列图片-->
   <td width="750" height="140">
   <div align="center" class="hlong">
   <img src="logo.jpg"
   width="80" height="100" />
   <div class="a"><b>&nbsp;植&nbsp;物&nbsp;检&nbsp;疫&nbsp;证&nbsp;书</b>
   </div>
   </div>
   <center>&nbsp;&nbsp;&nbsp;
   <img src="logo1.jpg" height="60" />
    </center>
</p >
   </td>
   <td align="center" width="20" rowspan="7"><div class="size">第<br /><br />一<br /><br />联<br /><br />存<br /><br />签<br /><br />证<br /><br />机<br /><br />关<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /></div></td>
  </tr>
 <tr> <!-- 2行1列检-->
    <td width="750" height="10" align="right" >林(<div style="display:inline" id="lin"></div><div style="display:inline">)检字:</div><div style="display:inline" id="inspection"></div>
    </td>
 </tr>
 <tr><!-- 3行6列个人信息-->
    <td height="200">
    <table  frame="above"  align="center"  border="1" cellspacing="0" cellpadding="0" width="750" height="200">
 <tr >
    <td width="150" >调运单位(人)及单位 
    </td>
    <td colspan="5" id="coLtdPersonAd">
    </td>    
 </tr>
 <tr>
    <td >调运(承办)人姓名</td>
    <td width="100" id="infoName"></td>
    <td width="100">身份证件号码</td>
    <td width="150" id="idNumber"></td>
    <td width="70">联系电话</td>
    <td  id="phoneNumber"></td> 
        
 </tr>
 <tr>
    <td >收货单位(人)及地址  
    </td>
    <td colspan="5" id="address">
    </td>
 </tr>
 <tr>
    <td> 植物或植物产品来源
    </td>      
    <td colspan="3"id="source"></td>
    <td >运输工具</td>
    <td id="transportMachine"></td>
 </tr> 
 <tr>
    <td >运输起讫</td>          
    <td colspan="5" id="transportFrom">
    </td>
 </tr> 
 <tr>
    <td>有效限期
    </td>
    <td colspan="5" id="date">
    </td>
 </tr>
</table>
 </td>
 </tr>
 <tr><!-- 4行6列产品信息-->
 <td>
 <table  frame="void" align="center"  border="1" cellspacing="0" cellpadding="0"  width="750">
 <tr>
    <td width="150" height="35">植物或植物产品名称
    </td>
    <td width="180" align="center">品名(或材种)
    </td>
    <td width="100" align="center">规&nbsp;&nbsp;格   </td>
    <td width="100" align="center">单&nbsp;&nbsp;位   </td>
    <td width="100" align="center">数&nbsp;&nbsp;量   </td>
    <td align="center">备&nbsp;&nbsp;注
    </td>    
 </tr>
<tbody id ="body">

</tbody>
</table>
 </td>
 </tr> 
 <tr> <!-- 5行1列盖章-->
 <td height="300">
 <table class="table" id="ip_table" align="center"   cellspacing="0" cellpadding="0" height="300" width="750">
 <tr>
  <td height="25" >&emsp;签发意见：&nbsp;&nbsp;上列调运的植物或植物产品，经(<div id ="detail" style="display:inline"></div><div style="display:inline">)</div>
  </td> 
 </tr>
 <tr>
  <td height="25" >&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&emsp;&emsp;未发现林业检疫性有害生物
  、本省(区、市)和调入省(区、市)补充林业检疫性有害
  </td>
 </tr>
 <tr>
  <td  >&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;生物、调入省(区、市)林业检疫机构提出的检疫要求列出的其它林业危险性有害生
  </td>
 </tr>
 <tr>
  <td  >
  &nbsp;&nbsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;物，同意调运。
  </td>
 </tr>
 <tr>
  <td height="25">&nbsp;
  </td>
 </tr>
 <tr>
  <td >
&emsp;委托机关(省级林业植物检疫机构检疫专用章)&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;签发机关(植物检疫专用章)
  </td>
 </tr>
 <tr>
  <td  >&nbsp;
  </td>
 </tr>
 <tr>
  <td align="right"  >
  检疫员(签名)&nbsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;
  </td>
 </tr>
 <tr>
  <td  >&nbsp;
  </td>
 </tr>
 <tr>
  <td align="right" width="45" id = "my_date">签证日期<div style="display:inline" id="isyear"></div><div style="display:inline">年</div><div style="display:inline" id="ismonth"></div><div style="display:inline">月</div><div style="display:inline" id="isday"></div><div style="display:inline">日</div>
  </table>
  </td>
 </tr>
 <tr><!-- 6行1列备注-->
 <td height="50">
 <table align="center"border="0" >
 <tr>  
    <td align="center" width="750" >注：1.本证无调出地省级林业植物检疫机构检疫专用章（受委托办理本证的须加盖本机构植物检疫&emsp;&emsp;&emsp;
    </td>
    </tr>
    <tr>
    <td>
    &emsp;&nbsp;&nbsp;专用章)和检疫员签名无效;2.本证、转让涂改或重复使用无效;3.一车(一船)一证,全程有效。
    </td>
 </tr>
</table>
 </td>
 </tr>
 <tr><td height="50"></td></tr> 
 </table>
</form>
</body>
</html>