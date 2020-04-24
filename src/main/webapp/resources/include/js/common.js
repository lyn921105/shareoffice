function chkData(items, msg){
	if($(items).val().replace(/\s/g,"")==""){
		alert(msg+" 입력해주세요.");
		$(items).val("");
		$(items).focus();
		return flase;
	} else{
		return true;
	}
}