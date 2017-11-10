function CreatePage(data){
	LODOP=getLodop(); 
	LODOP.PRINT_INITA(0,0,795,1061,"打印");
	LODOP.SET_SHOW_MODE("BKIMG_WIDTH","210mm");
	LODOP.SET_SHOW_MODE("BKIMG_HEIGHT","297mm");
	LODOP.SET_SHOW_MODE("BKIMG_PRINT",true); 
	//设置背景图 (nginx)
	LODOP.ADD_PRINT_SETUP_BKIMG("<img src='http://45.77.169.252/skt.png'>");
	//预览时是否显示背景图
	LODOP.SET_SHOW_MODE("BKIMG_IN_PREVIEW",true);
	//打印时是否显示背景图
	LODOP.SET_SHOW_MODE("BKIMG_PRINT",false); 
	LODOP.ADD_PRINT_TEXT(197,508,28,24,data[0].lin);
	LODOP.ADD_PRINT_TEXT(196,577,146,24,data[0].inspection);
	LODOP.ADD_PRINT_TEXT(227,205,518,24,data[0].address);
	LODOP.ADD_PRINT_TEXT(258,206,94,24,data[0].infoName);
	LODOP.ADD_PRINT_TEXT(257,404,140,24,data[0].idNumber);
	LODOP.ADD_PRINT_TEXT(257,618,104,24,data[0].phoneNumber);
	LODOP.ADD_PRINT_TEXT(288,206,516,24,data[0].coLtdPersonAd);
	LODOP.ADD_PRINT_TEXT(316,206,336,24,data[0].source);
	LODOP.ADD_PRINT_TEXT(317,616,112,24,data[0].transportMachine);
	LODOP.ADD_PRINT_TEXT(346,165,199,24,data[0].transportFrom);
	LODOP.ADD_PRINT_TEXT(346,391,99,24,data[0].transportBy);
	LODOP.ADD_PRINT_TEXT(347,514,203,24,data[0].transportTo);
	LODOP.ADD_PRINT_TEXT(378,151,92,24,data[0].validityYearS);
	LODOP.ADD_PRINT_TEXT(378,268,46,22,data[0].validityMonthS);
	LODOP.ADD_PRINT_TEXT(378,342,54,24,data[0].validityDayS);
	LODOP.ADD_PRINT_TEXT(378,436,80,24,data[0].validityYearE);
	LODOP.ADD_PRINT_TEXT(376,547,56,25,data[0].validityMonthE);
	LODOP.ADD_PRINT_TEXT(378,626,54,24,data[0].validityDayE);
	LODOP.ADD_PRINT_TEXT(738,375,327,24,data[0].detail);
	LODOP.ADD_PRINT_TEXT(952,552,49,24,data[0].year);
	LODOP.ADD_PRINT_TEXT(952,623,32,24,data[0].month);
	LODOP.ADD_PRINT_TEXT(951,670,30,24,data[0].day);
	var productLength = 0;
	//每行之间相差29像素
	var n = 29;
	//第一个值的高度
	var hight =437;
	//获取长度循环遍历输出打印结果
	for(var i = 0;i < getJsonObjLength(data);i++){
		LODOP.ADD_PRINT_TEXT(hight,66,129,24,data[0].product[i].plantName);
		LODOP.ADD_PRINT_TEXT(hight,206,142,24,data[0].product[i].variety);
		LODOP.ADD_PRINT_TEXT(hight,368,72,24,data[0].product[i].specification);
		LODOP.ADD_PRINT_TEXT(hight,454,75,24,data[0].product[i].unit);
		LODOP.ADD_PRINT_TEXT(hight,538,76,24,data[0].product[i].amount);
		LODOP.ADD_PRINT_TEXT(hight,623,92,24,data[0].product[i].remark);
		hight+=n;
	}
		
}
//json计数器
function getJsonObjLength(jsonObj) {
        var Length = 0;
		//获取product长度
        for (var item in jsonObj[0].product) {
            Length++;
        }
        return Length;
}
//直接打印
function Print(){
	$.ajax({
		url:"${APP_PATH}/getOneList",
		data:"id=1",
		type:"GET",
		dataType:"json",
		success:function(data){
			CreatePage(data);
			LODOP.PRINTA();
		}
	});
}