const app = angular.module("shopping-cart-app",[]);
app.controller("shopping-cart-ctrl",function($scope, $http, $compile){
	
//thêm sản phẩm vào giỏ hàng
	$scope.cart = {
		items: [],
		add(id){
			var item = this.items.find(item => item.id == id);
			if(item){
				item.qty++;
				this.saveToLocalStorage();
			}
			else{
				$http.get(`/rest/products/${id}`).then(resp => {
					resp.data.qty = 1;
					resp.data.image = `/assets/images/${resp.data.image}`;
					this.items.push(resp.data);
					this.saveToLocalStorage();
				})
			}
		},
		//lưu sản phẩm
		saveToLocalStorage(){
			var json = JSON.stringify(angular.copy(this.items));
			localStorage.setItem("cart",json);
		},
		get count(){ //Tính tổng số lượng các mặt hàng trong giỏ
			return this.items
			.map(item => item.qty)
			.reduce((total, qty) => total += qty, 0);
		},
		get amount(){ //Tổng thành tiền các mặt hàng trong giỏ
			return this.items
			.map(item => item.qty * item.price)
			.reduce((total, qty) => total += qty, 0);
		},
		//load giỏ hàng
		loadFormLocalStorage(){
			var json = localStorage.getItem("cart");
			this.items = json ? JSON.parse(json):[];
		},
		//xóa sản phảm trong giỏ hàng
		remove(id){
			var index = this.items.findIndex(item => item.id == id);
			this.items.splice(index, 1);
			this.saveToLocalStorage();
		},
		//xóa hết sản phẩm trong giỏ hàng
		clear(){
			this.items=[]
			this.saveToLocalStorage();
		}
	}
	$scope.cart.loadFormLocalStorage();

	$scope.order = {
		createDate: new Date(),
		address:"",
		account:{username:$("#username").text()},
		get orderDetails(){
			return $scope.cart.items.map(item => {
				return{
					product:{id: item.id},
					price: item.price,
					quantity: item.qty, 
				}
			});
		},
		purchase(){
			var order = angular.copy(this);
			$http.post("/rest/orders",order).then(resp => {
				alert("Đặt hàng thành công");
				$scope.cart.clear();
				location.href="/order/detail/" + resp.data.id;
			}).catch(error => {
				alert("Đặt hàng lỗi!")
				console.log(error)
				
			})
		}
	}



	//Sử lý các hàm sắp xếp và lọc sản phẩm
	$scope.loadPage = function(sort) {
		$.ajax({ 
		url: '/product/list/'+ sort +'?field=price',
		method: 'GET',
		success: function (response) {
		   //Cập nhật lại nội dung của trang web
		   $("#customers").fadeOut(400, function() {
			   var table = $(response).find("#customers").html();
			   $("#customers").html(table).fadeToggle();
			   var compiledHtml = $compile($("#customers"))($scope);
		   });			
		},
		error: function (xhr, status, error) {
		  console.log("Error: " + error);
		}
	   });
   }
   
   $scope.loadPage2 = function(sort) {
	   
		$.ajax({ 
		url: '/product/list/ASC?field=' + sort,
		method: 'GET',
		success: function (response) {
		   //Cập nhật lại nội dung của trang web
		   $("#customers").fadeOut(400, function() {
			   var table = $(response).find("#customers").html();
			   $("#customers").html(table).fadeToggle();
			   var compiledHtml = $compile($("#customers"))($scope);
		   });
						   
		},
		error: function (xhr, status, error) {
		  console.log("Error: " + error);
		}
	   });
   }
   
   $scope.filter = function(filter) {
		$.ajax({ 
		url: '/product/list?cid=' + filter,
		method: 'GET',
		success: function (response) {
		   //Cập nhật lại nội dung của trang web
		   $("#customers").fadeOut(400, function() {
			   var table = $(response).find("#customers").html();
			   $("#customers").html(table).fadeToggle();
			   var compiledHtml = $compile($("#customers"))($scope);
		   });
						   
		},
		error: function (xhr, status, error) {
		  console.log("Error: " + error);
		}
	   });
   }
   
   $scope.loadAll = function() {
		$.ajax({ 
		url: '/product/list',
		method: 'GET',
		success: function (response) {
		   //Cập nhật lại nội dung của trang web
		   $("#customers").fadeOut(400, function() {
			   var table = $(response).find("#customers").html();
			   $("#customers").html(table).fadeToggle();
			   var compiledHtml = $compile($("#customers"))($scope);
		   });
						   
		},
		error: function (xhr, status, error) {
		  console.log("Error: " + error);
		}
	   });
   }

   $scope.searchTerm = '';
   $scope.handleKeyPress = function(event) {
	// 13 là mã phím cho phím "Enter"
			if (event.which === 13) {
				var key = '0';
				if($scope.searchTerm != ''){
					key = $scope.searchTerm;
				}
				$.ajax({
						url: '/product/list/timkiem/' + key,
						method: 'GET',
						success: function(response) {
						// Cập nhật lại nội dung của trang web
						$("#customers").fadeOut(400, function() {
							var table = $(response).find("#customers").html();
							$("#customers").html(table).fadeToggle();
							var compiledHtml = $compile($("#customers"))($scope);
						});
						},
						error: function(xhr, status, error) {
						console.log("Error: " + error);
						}
					});	  
			}
  	};
})
	
