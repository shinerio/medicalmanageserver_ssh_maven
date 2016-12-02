/**
 * 
 */
	var dom = document.getElementById("figurecontainer");
	var mydatabody = document.getElementById("mydatabody");
	var myChart = echarts.init(dom);
	var app = {};
	var data = []; //横坐标数组
	var now; //ajax时间戳
	var value = 0; //坐标值数组
	var timeInterval = 100; //刷新时间间隔
	option = null;
	function init(){
		dom = document.getElementById("figurecontainer");
		mydatabody = document.getElementById("mydatabody");
		myChart = echarts.init(dom);
		app = {};
		data = []; //横坐标数组
		value = 0; //坐标值数组
		timeInterval = 1000;
		app.timeTicket = setInterval(refresh, timeInterval);
		option = {
				title : {
					text : '动态折线图'
				},
				tooltip : {
					trigger : 'axis',
					formatter : function(params) {
						params = params[0];
						var date = new Date(params.name);
						return date.getHours() + ':' + date.getMinutes() + ':'
								+ date.getSeconds() + ' /' + params.value[1];//垂直游标
					},
					axisPointer : {
						animation : false
					}
				},
				xAxis : {
					type : 'time',
					splitLine : {
						show : false
					}
				},
				yAxis : {
					type : 'value',
					boundaryGap : [ 0, '100%' ],
					splitLine : {
						show : false
					}
				},
				visualMap : { //分区折线颜色
					pieces : [ {
						gt : 0,
						lte : 30,
						color : '#333CFF'
					}, {
						gt : 30,
						lte : 60,
						color : '#000000'
					}, {
						gt : 60,
						lte : 90,
						color : '#FF0000'
					} ]
				},
				series : [ {
					name : '模拟数据',
					type : 'line',
					showSymbol : false,
					hoverAnimation : false,
					data : data,
					markLine : { //分割线
						silent : true,
						data : [ {
							yAxis : 30
						}, {
							yAxis : 60
						}, {
							yAxis : 90
						} ]
					}
				} ]
			};
			if (option && typeof option === "object") {
				myChart.setOption(option, true);
			}
			for (var i = 0; i < 12; i++) {
				var mytr = mydatabody.insertRow();
				var node = mytr.insertCell();
				var atd = mytr.insertCell();
				var btd = mytr.insertCell();
				var ctd = mytr.insertCell();
				var dtd = mytr.insertCell();
				atd.className = "cellNormal";
				dtd.className = "cellNormal";
				btd.className = "cellNormal";
				ctd.className = "cellNormal";
				node.innerHTML = i + 1;
			}
			for (var i = 0; i < 60; i++) { //先初始化一些数据作为x周长度
				data.push(pushData());
			}
	}
	function pushData() {
		now = new Date(); //时间戳
		var d = new Date();//这个是横坐标
		$.ajax({
			type : "GET",
			url : "refresh.do",
			data : "doRefresh" + now, //发送到数据端的数据(数据发送得不同，最好加上时间戳，否则返回数据使用缓存，不会产生变化)
			dataType : "json", //返回数据类型
			success : function(data) {
				//var mydatabody = document.getElementById("mydatabody");
				mydatabody.innerHTML = "";
				for (var i = 0; i < data.length-1; i++) {
					var mytr = mydatabody.insertRow();
					var node = mytr.insertCell();
					var atd = mytr.insertCell();
					var btd = mytr.insertCell();
					var ctd = mytr.insertCell();
					var dtd = mytr.insertCell();
					if (data[i].a > 0.8) {
						atd.className = "cellOver";
					} else if (data[i].a < 0.2) {
						atd.className = "cellBelow";
					} else {
						atd.className = "cellNormal";
					}
					if (data[i].d > 0.8) {
						dtd.className = "cellOver";
					} else if (data[i].d < 0.2) {
						dtd.className = "cellBelow";
					} else {
						dtd.className = "cellNormal";
					}
					if (data[i].b > 0.8) {
						btd.className = "cellOver";
					} else if (data[i].b < 0.2) {
						btd.className = "cellBelow";
					} else {
						btd.className = "cellNormal";
					}
					if (data[i].c > 0.8) {
						ctd.className = "cellOver";
					} else if (data[i].c < 0.2) {
						ctd.className = "cellBelow";
					} else {
						ctd.className = "cellNormal";
					}
					node.innerHTML = i + 1;
					atd.innerHTML = data[i].a;
					btd.innerHTML = data[i].b;
					ctd.innerHTML = data[i].c;
					dtd.innerHTML = data[i].d;
				}
				//更新折线图数据
				value = data[data.length-1].value;
				d.setFullYear(data[data.length-1].date.year + 1900);
				d.setMonth(data[data.length-1].date.month);
				d.setDate(data[data.length-1].date.date);
				d.setHours(data[data.length-1].date.hours);
				d.setMinutes(data[data.length-1].date.minutes);
				d.setSeconds(data[data.length-1].date.seconds);
			}
		});
		return {
			name : d.toString(),
			value : [ d, Math.round(value) ]
		}
	}

	function refresh() {
		data.shift();
		data.push(pushData());
		myChart.setOption({
			series : [ {
				data : data
			} ]
		});
	}
	function stop() {
		clearInterval(app.timeTicket);
	}

	function begin() {
		app.timeTicket = setInterval(refresh, timeInterval);
	}