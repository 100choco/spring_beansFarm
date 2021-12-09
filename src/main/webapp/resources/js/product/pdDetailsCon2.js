
$(function () {
	
	
	
	var op1Chk = true;
	var op2Chk = true;
	var productPrice = parseInt($("#productPrice").val());
	alert(numWithCommas(productPrice));
	var op1price = 0;
	var op2price = 0;
	
	
	
	$("#totalPrice").html(numWithCommas(productPrice + op1price + op2price));
	
	$(".op1").on("change", function () {
			alert("ddd");
			var op1 = $(".op1").val();
			alert(op1);
			var html = "";
			var op1Quantity = 1;
			
			
			$.ajax({

				url : '/product/product_details/opAjax1',
				data : {"op1":op1},
				type : 'POST', 
				dataType : 'Json',
				success : function(data) {
					var num = data.op_no;
					var name = data.op_name;
					var stock = data.op_stock
					var price = data.op_price;
					
					if(op1Chk == true){
						op1price = (productPrice +price) * op1Quantity;
						html += '<tr id="op1Tr">';
						html += '<td id = "op1Name">' + name + '</td>';
						html += '<td>'+ 
							'<button id = "op1minus">'+"-"+'</button>' 
							+ " " + '<span id = "op1Quantity">' + op1Quantity + '</span>' + " " + 	
							'<button id = "op1Plus">'+"+"+'</button>'
							+ '</td>';
						html += '<td id = "op1price">' + numWithCommas(op1price) +  '</td>';
						html += '</tr>';
						
						op1price = (productPrice +price) * op1Quantity;
						$("#tb_op").append(html);
						$("#totalPrice").html(numWithCommas(op1price+op2price));
						$("#point").html(numWithCommas((op1price+op2price)/10));
						$("#order_price").val(op1price+op2price);
						$("#op_no1").val(num);
						$("#option_quantity1").val(op1Quantity);
						op1Chk = false;
					}else{
						op1price = (productPrice +price) * op1Quantity;
						$("#op1Tr").empty();
						html += '<td id = "op1Name">' + name + '</td>';
						html += '<td>' +
						'<button id = "op1minus">'+"-"+'</button>' 
						+ " " + '<span id = "op1Quantity">' + op1Quantity + '</span>' + " " + 	
						'<button id = "op1Plus">'+"+"+'</button>'
						+ '</td>';
						html += '<td id = "op1price">' +  numWithCommas(op1price) +  '</td>';
						
						
						$("#op1Tr").append(html);
						$("#totalPrice").html(numWithCommas(op1price+op2price));
						$("#point").html(numWithCommas((op1price+op2price)/10));
						$("#order_price").val(op1price+op2price);
						$("#option_quantity1").val(op1Quantity);
						$("#op_no1").val(num);
					}
					
					$("#op1Plus").on("click", function () {
						
						if(op1Quantity < stock){
							op1Quantity = op1Quantity +1;
						}else{
							alert("재고가 없습니다.");
						}
						op1price = (productPrice +price) * op1Quantity;
						$("#op1Quantity").html(op1Quantity);
						$("#op1price").html(numWithCommas(op1price));
						$("#point").html(numWithCommas((op1price+op2price)/10));
						$("#totalPrice").html(numWithCommas(op1price+op2price));
						$("#order_price").val(op1price+op2price);
						$("#option_quantity1").val(op1Quantity);
						
						
					
					})
					
					$("#op1minus").on("click", function () {
						
						if(op1Quantity > 1){
							op1Quantity = op1Quantity - 1;
						}	
						op1price = (productPrice +price) * op1Quantity;
						$("#op1Quantity").html(op1Quantity);
						$("#op1price").html(numWithCommas(op1price));
						$("#point").html(numWithCommas((op1price+op2price)/10));
						$("#totalPrice").html(numWithCommas(op1price+op2price));
						$("#order_price").val(op1price+op2price);
						$("#option_quantity1").val(op1Quantity);
						
					
					})
					
				}

			})
			
		

	})
	
		
	
	$(".op2").on("change", function () {
			alert("aaa");
			var op2 = $(".op2").val();
			alert(op2);
			var html = "";
			var op1Quantity = 1;
			
			
			$.ajax({

				url : '/product/product_details/opAjax2',
				data : {"op2":op2},
				type : 'POST', 
				dataType : 'Json',
				success : function(data) {
					var num = data.op_no;
					var name = data.op_name;
					var stock = data.op_stock;
					var price = data.op_price;
					
					if(op2Chk == true){
						op2price = price;
						html += '<tr id="op2Tr">';
						html += '<td id = "op2Name">' + name + '</td>';
						html += '<td>'+ "-" + '</td>'
						html += '<td id = "op2price">' + numWithCommas(op2price) + '</td>';
						html += '</tr>';
						
						
						$("#tb_op").append(html);
						$("#totalPrice").html(numWithCommas(op1price+op2price));
						$("#order_price").val(op1price+op2price);
						$("#point").html(numWithCommas((op1price+op2price)/10));
						$("#op_no2").val(num);
						op2Chk = false;
					}else{
						$("#op2Tr").empty();
						op2price = price;
						html += '<td id = "op2Name">' + name + '</td>';
						html += '<td>' +"-"	+ '</td>';
						html += '<td id = "op2price">' + numWithCommas(op2price) + '</td>';

						$("#op2Tr").append(html);
						$("#totalPrice").html(numWithCommas(op1price+op2price));
						$("#point").html(numWithCommas((op1price+op2price)/10));
						$("#order_price").val(op1price+op2price);
						$("#op_no2").val(num);
					}
				
					
				}

			})
			
		

	})
	

	// 천단위 콤마찍는 함수
 	function numWithCommas(num) {
		var commas = num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		return commas;
	} 
})
