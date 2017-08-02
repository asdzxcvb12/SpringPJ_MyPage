$(document).ready(function() {
	$('#membership_page').on('click', function() {	
		
		var login_form = $('#login_form');
		
		$('#membership').attr('value', 'membership');
		
		login_form.attr('method', 'get');
		login_form.attr('action', '/spring/');
		
		$('#login_form').submit();
		
	});
});

function go_time() {

	var now = new Date();

	var year = now.getFullYear(); // 년
	var month = now.getMonth()+1; // 월
	var date = now.getDate(); // 일
	var day = now.getDay(); // 요일
	var hour = now.getHours(); // 시
	var min = now.getMinutes(); // 분
	var sec = now.getSeconds(); // 초
	var am_pm;
	
	if(hour > 12) {
		am_pm = 'PM';
		hour = hour - 12;
		hour = '0'+hour;
	} else if(hour <= 12) {
		am_pm = 'AM';
		hour = '0'+hour;
	}
	
	if(min < 10) min = '0' + min;
	if(sec < 10) sec = '0' + sec;

	$('#ymd').html(year + "年 " + month + "月 " + date + "日 " + getTransDay(day));
	$('#time').html(am_pm + "  " + hour + ":" + min + ":" + sec);

	setTimeout("go_time()", 1000);
}

function getTransDay(day) {
	if(day == 0) return 'Sun'
	if(day == 1) return 'Mon'
	if(day == 2) return 'Tue'
	if(day == 3) return 'Wed'
	if(day == 4) return 'Thu'
	if(day == 5) return 'Fri'
	if(day == 6) return 'Sat'
}
