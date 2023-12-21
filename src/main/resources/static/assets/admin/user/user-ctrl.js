app.controller("user-ctrl", function($scope, $http){
	$scope.items = [];
	$scope.form = {};
	
	$scope.form = {
		photo:'cloud-upload.jpg',
		available: true,
	};
	
	$scope.initialize = function(){
		// load product
		$http.get("/rest/Accounts").then(resp => {
			$scope.items = resp.data;
		});
	}

	$scope.initialize();
	
	$scope.reset = function(){
		$scope.form = {
			photo:'cloud-upload.jpg',
			available: true,
		};
	}
	$scope.edit = function(item){
		$scope.form = angular.copy(item);
		$("#home-tab").tab('show')
	}
	$scope.create = function(){
		var item = angular.copy($scope.form);
		var item = angular.copy($scope.form);
		// Sử dụng AngularJS để truy cập phần tử input file có id là "photo"
		var imageInputElement = angular.element(document.getElementById('photo'));

		// Lấy giá trị của thuộc tính 'value' của phần tử input file
		var fileName = imageInputElement.val();

		// Lấy tên file từ đường dẫn
		var fileNameOnly = fileName.split('\\').pop();
		item.photo = fileNameOnly;
		$http.post('/rest/Accounts',item).then(resp => {
			$scope.items.push(resp.data);
			$scope.reset();
			alert("Thêm mới tài khoản thành công");
		}).catch(error => {
			alert("Lỗi tạo mới tài khoản");
			console.log("Error", error);
		});
	}
	$scope.update = function(){
		var item = angular.copy($scope.form);
		// Sử dụng AngularJS để truy cập phần tử input file có id là "image"
		var imageInputElement = angular.element(document.getElementById('photo'));

		// Lấy giá trị của thuộc tính 'value' của phần tử input file
		var fileName = imageInputElement.val();

		// Lấy tên file từ đường dẫn
		var fileNameOnly = fileName.split('\\').pop();
		item.photo = fileNameOnly;

		$http.put(`/rest/Accounts/${item.username}`, item).then(resp => {
			var index = $scope.items.findIndex(p => p.username == item.username);
			$scope.items[index] = item;
			alert("Cập nhật tài khoản thành công");
		}).catch(error => {
			alert("Lỗi cập nhật tài khoản");
			console.log("Error", error);
		});
	}
	$scope.delete = function(item){
		$http.delete(`/rest/Accounts/${item.username}`).then(resp => {
			var index = $scope.items.findIndex(p => p.username == item.username);
			$scope.items.splice(index, 1);
			$scope.reset();
			alert("Xóa tài khoản thành công");
		}).catch(error => {
			alert("Lỗi xóa tài khoản");
			console.log("Error", error);
		});
	}
	
	$scope.imageChanged = function(files){
		var data = new FormData();
		data.append('file', files[0]);
		$http.post('/rest/upload/images', data,{
			transformRequest: angular.identity,
			headers:{'Content-Type':undefined}
		}).then(resp => {
			$scope.form.photo = resp.data.name;
		}).catch(error => {
			alert("Lỗi upload hình ảnh");
			console.log("Error", error);
		})
	}
	
	$scope.pager = {
		page: 0,
		size: 10,
		get items(){
			var start = this.page * this.size;
			return $scope.items.slice(start, start + this.size);
		},
		get count(){
			return Math.ceil(1.0 * $scope.items.length / this.size);
		},
		first(){
			this.page = 0;
		},
		prev(){
			this.page--;
			if(this.page < 0){
				this.last();
			}
		},
		next(){
			this.page++;
			if(this.page >= this.count){
				this.first();
			}
		},
		last(){
			this.page = this.count - 1;
		}
	}
	
});