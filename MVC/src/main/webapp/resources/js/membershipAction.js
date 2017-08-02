/* effectiveness test id */
function effectID(id) {
	var effectID = $('#effectID');
	
	var hangle = id.search(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g);
	var spe = id.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	var ws = id.search(/\s/);
	
	/*//좌우 방향키, 백스페이스, 딜리트, 탭키 제외
    if(event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39
    || event.keyCode == 46 ) return;
    */
	
    if(id.length < 7) effectID.html('Please enter at least 7 charactors.');
    else if(hangle >= 0 || spe >= 0 || ws >= 0) effectID.html('Please not include hangle, special characters and white space.');
    else effectID.html('check');
    
    if(id == '') effectID.html('');
}

/* effectiveness test pw */
function effectPW(pw) {
	var effectPW = $('#effectPW');
	var chkingPW = $('#chkingPW');
	var chkMemberPW = $('#chkMemberPW');
	
	var num = pw.search(/[0-9]/g);
	var eng = pw.search(/[a-z]/ig);
	var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	
	console.log(num);
	console.log(eng);
	console.log(spe);
	
	if(pw.length < 8) {
		effectPW.html('Please enter at least 8 charactors.');
		chkMemberPW.attr('disabled', 'disabled');
	} else if(pw.search(/\s/) != -1) {
		effectPW.html('Please not include white space');
		chkMemberPW.attr('disabled', 'disabled');
	} else if(num < 0 || eng < 0 || spe < 0) {
		effectPW.html('Please include that one or more alphabets, numbers, and special characters.');
		chkMemberPW.attr('disabled', 'disabled');
	} else {
		effectPW.html('complete check!.. good boy');
		chkingPW.html('check');
		chkMemberPW.removeAttr('disabled');	
	}
	
	if(pw == '') {
		effectPW.html('');
		chkingPW.html('');
		chkMemberPW.attr('disabled', 'disabled');
	}
}

/* chk pw */
function chkPW(obj) {
	var membershipPW = $('#membershipPW').val();
	var chkPW = $('#chkPW');
	
	console.log('checking....');
	console.log(membershipPW);
	console.log(obj);
	
	if(membershipPW == obj) {
		chkPW.html('check'); 
		if(obj == '') chkPW.html('');
	} else {
		chkPW.html('fail');
		if(obj == '') chkPW.html('');
	}
}

/* e-mail back change */
function chEmail(back) {
	var backEmail = $('#backEmail');
	
	backEmail.val(back);
	
	if(back == 'self') {
		backEmail.val('');
		backEmail.removeAttr('disabled');
	} else backEmail.attr('disabled', 'disabled');
}

/* animation for popup */
function wrapWindowByMask(){
    // 화면의 높이와 너비를 변수로 만듭니다.
    var maskHeight = $(document).height();
    var maskWidth = $(window).width();

    // 마스크의 높이와 너비를 화면의 높이와 너비 변수로 설정합니다.
    $('.mask').css({'width':maskWidth,'height':maskHeight});

    // fade 애니메이션 : 1초 동안 검게 됐다가 80%의 불투명으로 변합니다.
    $('.mask').fadeIn(1000);
    $('.mask').fadeTo("slow",0.8);

    // 레이어 팝업을 가운데로 띄우기 위해 화면의 높이와 너비의 가운데 값과 스크롤 값을 더하여 변수로 만듭니다.
    var left = ( $(window).scrollLeft() + ( $(window).width() - $('.window').width()) / 2 );
    var top = ( $(window).scrollTop() + ( $(window).height() - $('.window').height()) / 2 );

    // css 스타일을 변경합니다.
    $('.window').css({'left':left,'top':top, 'position':'absolute'});

    // 레이어 팝업을 띄웁니다.
    $('.window').show();
}

/* e-mail action */
function onclick_mail() {
	var frontEmail = $('#frontEmail').val();
	var backEmail = $('#backEmail').val();

	var email = frontEmail + '@' + backEmail;
	
	var sendData = {"email":email};
	
	$.ajax({
		url: 'memberEmail',
		type: 'post',
		data: sendData,
		success: function(setValues) {
			var result = JSON.parse(setValues);
			wrapWindowByMask();
			//alert('e-mail : '+result.email+"\ncode : "+result.code);
		}
	});

}

function timegoo() {
	var detailAddress = $('#detailAddress').val();
	
	detailAddress -= 1;
}

function inputEmailVisibility() {
	if($('[name="chkTermsOne"]:checked').val() == 'agree' && $('[name="chkTermsTwo"]:checked').val() == 'agree'){
		$('#inputEmail').css('display','inline');
	} else {
		$('#inputEmail').css('display','none');
	}
}
/* onload action */
$(document).ready(function() {
/* top character */
	console.log('ddddd');
	console.log($('#getMemberAttr').val());
	if($('#getMemberAttr').val() != null) {
		if($('#getMemberAttr').val() == 'terms') {
			console.log('terms in');
			$('#memTerms').css({'color':'black','font-weight':'bold'});
			$('#memInfo').css({'color':'gray','font-weight':'normal'});
			$('#memComplete').css({'color':'gray','font-weight':'normal'});
		} else if($('#getMemberAttr').val() == 'info') {
			console.log('info in');
			$('#memTerms').css({'color':'gray','font-weight':'normal'});
			$('#memInfo').css({'color':'black','font-weight':'bold'});
			$('#memComplete').css({'color':'gray','font-weight':'normal'});
		} else if($('#getMemberAttr').val() == 'result') {
			console.log('result in');
			$('#memTerms').css({'color':'gray','font-weight':'normal'});
			$('#memInfo').css({'color':'gray','font-weight':'normal'});
			$('#memComplete').css({'color':'black','font-weight':'bold'});
		}
	}
	
/* POPup Action */	
    $('.window .close').click(function (e) {
        e.preventDefault();
        $('.mask, .window').hide();
    });

    $('.mask').click(function () {
        $(this).hide();
        $('.window').hide();
    });
    
    $('#code_submit').click(function (){
    	$('.mask, .window').hide();
    	$('#cancle_next').css('display','inline');
    	alert('good boy');
    });
    
/* checkbox select one item */
	inputEmailVisibility();
			
	$('input[type="checkbox"][name="chkTermsOne"]').click(function(){
        if ($(this).prop('checked')) {
            $('input[type="checkbox"][name="chkTermsOne"]').prop('checked', false);
            $(this).prop('checked', true);
            inputEmailVisibility();
        }
	});
	
	$('input[type="checkbox"][name="chkTermsTwo"]').click(function(){
		if ($(this).prop('checked')) {
			$('input[type="checkbox"][name="chkTermsTwo"]').prop('checked', false);
			$(this).prop('checked', true);
			inputEmailVisibility();		
		}
	});
/* terms next action */
	$('#termsNext').on('click', function() {
		location.href="/spring/?membership=membership&memberAttr=info";
	});
/* test */
	$('#testTr').on('click', function() {
		window.open("test","Event","menubar=no, width=400, height=300, toolbar=no")
	});
	
	
/* address action */
	$('#address').on('click', function() {
        new daum.Postcode({
            oncomplete: function(data) {

                var fullRoadAddr = data.roadAddress;
                var extraRoadAddr = '';

                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }

                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }

                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
                
                $('#postcode').val(data.zonecode);
                $('#roadAddress').val(fullRoadAddr);
                $('#jibunAddress').val(data.jibunAddress);

                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    $('#guide').html('(예상 도로명 주소 : ' + expRoadAddr + ')');
                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    $('#guide').html('(예상 지번 주소 : ' + expJibunAddr + ')');
                } else {
                	$('#guide').html('');
                }
            }
        }).open();
	});


/* membership log */
	$('#membershipForm').on('submit', function() {

		var membershipID = $('#membershipID');
		var membership_ID = $('#membership_ID');
		var membershipPW = $('#membershipPW');
		var membership_PW = $('#membership_PW');
		
		var RSAModulus = $('#RSAModulus');
		var RSAExponent = $('#RSAExponent');

		$('#this').attr('action', 'actionTest');
		$('#this').attr('method', 'post');

		var rsa = new RSAKey();
		rsa.setPublic(RSAModulus.val(), RSAExponent.val());
		
		membership_ID.val(rsa.encrypt(membershipID.val()));
		membership_PW.val(rsa.encrypt(membershipPW.val()));	
		
		console.log(membership_ID.val());
		console.log(membership_PW.val());
		
		membershipID.val("");
		membershipPW.val("");
	});
});
