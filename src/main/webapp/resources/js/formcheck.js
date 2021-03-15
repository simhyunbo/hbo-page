/**
 * 
 */

function memberFormCheck(){
	
//아이디 중복검사	
		if(document.forms["memReg"]["isIdCheck"].value == 1){
		document.forms["memReg"]["id"].focus();
		return false;
	}
	
	if (document.forms["memReg"]["pw"].value.length < 5){
		document.getElementById("pw1").innerHTML = "*패스워드 길이를 확인하세요";
		return false;
	}
		
//이메일 체크
if(document.forms["memReg"]["eid"].value == 0 && 
document.forms["memReg"]["domain"].value != 0){
	document.getElementById("domain1").innerHTML = "입력"
	}	

//성별 체크
   if(document.forms["memReg"]["gender"].value == ""){
	document.getElementById("gender_error").innerText = "성별을 체크하세요";
	return false;
	}

//취미체크, 최소1개선택

var hobby_length = document.forms["memReg"]["hobby"].length;
console.log("취미갯수: " + hobby_length);
var cnt = 0;
for(i=0; i< hobby_length; i++)
	{
//	console.log("변수 i 값 : " + i);

	if(document.forms["memReg"]["hobby"][i].checked){
	
	cnt++;
	break;
	// break 반복문에서 빠져나가라
	
	}
	}
	if (cnt==0){
	
	document.getElementById("hobby_e").innerHTML = "취미를 선택하세요";
	return false;
	}
	
	
}



function inputDomain(){
	var sel = document.forms["memReg"]["sel_domain"].value;
	document.forms["memReg"]["domain"].value = sel;
	
	if(sel == ""){
		document.forms["memReg"]["domain"].readOnly=true;
	} else{
		document.forms["memReg"]["domain"].readOnly=false;
	}
	
}




function idCheck(){
	var id = document.forms["memReg"]["id"].value;
	
	if(id.length == 0){
		alert('아이디를 입력하세요');		
		return;
	}
	
	var x = new XMLHttpRequest();
	
	x.onreadystatechange = function() {
		
		if(x.readyState === 4) {
			
			if(x.status === 200){
				
				var msg = document.getElementById("idCheckMsg");
				
				document.getElementById("isIdCheck").value = x.responseText.trim(); 
				
				if(x.responseText.trim()  ===  "0"){
					msg.innerText = "사용가능한 아이디 입니다.";
				} else {
					msg.innerText = "중복된 아이디 입니다.";
				}
				
			} else {				
				console.log('에러코드 : ' + x.status);
			}
			
		}
	};
	
	x.open("POST", "/member/idDoubleCheck", true);
	x.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	x.send("id=" + id);	
}

