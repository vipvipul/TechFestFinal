<script type="text/javascript">
	var total_seconds=30*60;
	var minutes=parseInt(total_seconds/60);
	var seconds=parseInt(total_seconds%60);
	function checkTime(){
		document.getElementById("quiz-time-left").innerHTML = minutes+":"+seconds;
		if(total_seconds==0){
			setTimeout(function() {
				document.getElementById("submitBtn").submit();
			},1);
		}else{
			total_seconds=total_seconds-1;
			minutes=parseInt(total_seconds/60);
			seconds=parseInt(total_seconds%60);
			setTimeout("checkTime()",1000);
		}
	}
	setTimeout("checkTime()",1000);
</script>