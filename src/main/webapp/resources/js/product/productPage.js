$(function () {
	$(".pageInfo a").on("click",function(e) {
			var moveForm = $(".moveForm");
			
			e.preventDefault();
			moveForm.find("input[name = 'pageNum']").val($(this).attr("href"));
			moveForm.attr("action", "/product/product_view");
			moveForm.submit();
			
	})
})