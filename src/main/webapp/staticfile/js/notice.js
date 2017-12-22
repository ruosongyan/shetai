function viewNotice(obj){
	console.log($(obj).children('.notice-content').html())
	var title=$(obj).children('.notice-title').html();
	console.log("title: "+title);
	var date=$(obj).children('.notice-date').html();
	var content=$(obj).children('.notice-content').html();
	$('#noticeModal').find('.modal-title').html(title+"   -"+date);
	$('#noticeModal').find('.modal-body').html(content);
	$('#noticeModal').modal('show');
}