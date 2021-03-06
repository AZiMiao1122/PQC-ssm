function RealPrint(id){
	LODOP=getLodop(); 
	LODOP.PRINT_INITA(0,0,795,1061,"打印");
	LODOP.SET_SHOW_MODE("BKIMG_WIDTH","210mm");
	LODOP.SET_SHOW_MODE("BKIMG_HEIGHT","297mm");
	LODOP.SET_SHOW_MODE("BKIMG_PRINT",true); 
	
	$.ajax({
		url:"${APP_PATH}/getoneinfomation"+id,
		type:"GET",
		success:function(info){
			LODOP.ADD_PRINT_TEXT(197,508,28,24,info[0].lin);
			LODOP.ADD_PRINT_TEXT(196,577,146,24,info[0].inspection);
			LODOP.ADD_PRINT_TEXT(227,205,518,24,info[0].address);
			LODOP.ADD_PRINT_TEXT(258,206,94,24,info[0].infoName);
			LODOP.ADD_PRINT_TEXT(257,404,140,24,info[0].idNumber);
			LODOP.ADD_PRINT_TEXT(257,618,104,24,info[0].phoneNumber);
			LODOP.ADD_PRINT_TEXT(288,206,516,24,info[0].coLtdPersonAd);
			LODOP.ADD_PRINT_TEXT(316,206,336,24,info[0].source);
			LODOP.ADD_PRINT_TEXT(317,616,112,24,info[0].transportMachine);
			LODOP.ADD_PRINT_TEXT(346,165,199,24,info[0].transportFrom);
			LODOP.ADD_PRINT_TEXT(346,391,99,24,info[0].transportBy);
			LODOP.ADD_PRINT_TEXT(347,514,203,24,info[0].transportTo);
			LODOP.ADD_PRINT_TEXT(378,151,92,24,info[0].validityYearS);
			LODOP.ADD_PRINT_TEXT(378,268,46,22,info[0].validityMonthS);
			LODOP.ADD_PRINT_TEXT(378,342,54,24,info[0].validityDayS);
			LODOP.ADD_PRINT_TEXT(378,436,80,24,info[0].validityYearE);
			LODOP.ADD_PRINT_TEXT(376,547,56,25,info[0].validityMonthE);
			LODOP.ADD_PRINT_TEXT(378,626,54,24,info[0].validityDayE);
			LODOP.ADD_PRINT_TEXT(738,375,327,24,info[0].detail);
			LODOP.ADD_PRINT_TEXT(952,552,49,24,info[0].year);
			LODOP.ADD_PRINT_TEXT(952,623,32,24,info[0].month);
			LODOP.ADD_PRINT_TEXT(951,670,30,24,info[0].day);
		}
	});
	
	$.ajax({
		url:"${APP_PATH}/getoneproduct"+id,
		type:"GET",
		success:function(pro){
			var productLength = 0;
			//每行之间相差29像素
			var n = 29;
			//第一个值的高度
			var hight =437;
			//获取长度循环遍历输出打印结果
			for(var i = 0;i < getJsonObjLength(pro);i++){
				LODOP.ADD_PRINT_TEXT(hight,66,129,24,pro[i].plantName);
				LODOP.ADD_PRINT_TEXT(hight,206,142,24,pro[i].variety);
				LODOP.ADD_PRINT_TEXT(hight,368,72,24,pro[i].specification);
				LODOP.ADD_PRINT_TEXT(hight,454,75,24,pro[i].unit);
				LODOP.ADD_PRINT_TEXT(hight,538,76,24,pro[i].amount);
				LODOP.ADD_PRINT_TEXT(hight,623,92,24,pro[i].remark);
				hight+=n;
			}
		}
	});
	LODOP.PRINTA();
	
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