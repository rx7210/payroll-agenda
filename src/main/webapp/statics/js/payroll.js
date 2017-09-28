$(document).ready(function() {
	$("#searchForm").submit(function(event) {
		$.ajax({
			url : $(this).attr("action"),
			type : "POST",
			data : $(this).serialize(),
			success : function(response) {
				showDiv("respSearch");		
				$("#response").html(response);
				$("#searchValue").val("");
			}
		});
		event.preventDefault();
	});
});

function hideDiv(idDiv) {
	document.getElementById(idDiv).style.display = "none";
	return;
}

function showDiv(idDiv) {
	document.getElementById(idDiv).style.display = "block";
	document.getElementById(idDiv).style.zIndex = "2";
	return;
}