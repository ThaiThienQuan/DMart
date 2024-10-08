app.controller("product-ctrl", function($scope, $http) {
	$scope.items = [];
	$scope.cates = [];
	$scope.form = {};

	$scope.form = {
		createDate: new Date(),
		image: 'cloud-upload.jpg',
		available: true,
	};

	$scope.initialize = function() {
		// load product
		$http.get("/rest/products").then(resp => {
			$scope.items = resp.data;
			$scope.items.forEach(item => {
				item.createDate = new Date(item.createDate)
			})
		});
		//load categories
		$http.get("/rest/categories").then(resp => {
			$scope.cates = resp.data;
		});
	}

	$scope.initialize();

	$scope.reset = function() {
		$scope.form = {
			createDate: new Date(),
			image: 'cloud-upload.jpg',
			available: true,
		};
	}
	$scope.edit = function(item) {
		$scope.form = angular.copy(item);
		$("#home-tab").tab('show')
	}
	$scope.create = function() {
		var item = angular.copy($scope.form);
		var item = angular.copy($scope.form);
		// Sử dụng AngularJS để truy cập phần tử input file có id là "image"
		var imageInputElement = angular.element(document.getElementById('image'));

		// Lấy giá trị của thuộc tính 'value' của phần tử input file
		var fileName = imageInputElement.val();

		// Lấy tên file từ đường dẫn
		var fileNameOnly = fileName.split('\\').pop();
		item.image = fileNameOnly;
		$http.post('/rest/products', item).then(resp => {
			resp.data.createDate = new Date(resp.data.createDate);
			$scope.items.push(resp.data);
			$scope.reset();	
			alert("Thêm mới sản phẩm thành công");
		}).catch(error => {
			alert("Lỗi thêm mới sản phẩm");
			console.log("Error", error);
		});
	}
	$scope.update = function() {
		var item = angular.copy($scope.form);
		// Sử dụng AngularJS để truy cập phần tử input file có id là "image"
		var imageInputElement = angular.element(document.getElementById('image'));

		// Lấy giá trị của thuộc tính 'value' của phần tử input file
		var fileName = imageInputElement.val();

		// Lấy tên file từ đường dẫn
		var fileNameOnly = fileName.split('\\').pop();
		item.image = fileNameOnly;

		$http.put(`/rest/products/${item.id}`, item).then(resp => {
			var index = $scope.items.findIndex(p => p.id == item.id);
			$scope.items[index] = item;
			$scope.reset();
			alert("Cập nhật sản phẩm thành công");
		}).catch(error => {
			alert("Lỗi cập nhật sản phẩm");
			console.log("Error", error);
		});
	}
	$scope.delete = function(item) {
		$http.delete(`/rest/products/${item.id}`).then(resp => {
			var index = $scope.items.findIndex(p => p.id == item.id);
			$scope.items.splice(index, 1);
			$scope.reset();
			alert("Xóa sản phẩm thành công");
		}).catch(error => {
			alert("Lỗi xóa sản phẩm");
			console.log("Error", error);
		});
	}

	$scope.imageChanged = function(files) {
		var data = new FormData();
		data.append('file', files[0]);
		$http.post('/rest/upload/images', data, {
			transformRequest: angular.identity,
			headers: { 'Content-Type': undefined }
		}).then(resp => {
			$scope.form.image = resp.data.name;
		}).catch(error => {
			alert("Lỗi upload hình ảnh");
			console.log("Error", error);
		})
	}

	$scope.pager = {
		page: 0,
		size: 8,
		get items() {
			var start = this.page * this.size;
			return $scope.items.slice(start, start + this.size);
		},
		get count() {
			return Math.ceil(1.0 * $scope.items.length / this.size);
		},
		first() {
			this.page = 0;
		},
		prev() {
			this.page--;
			if (this.page < 0) {
				this.last();
			}
		},
		next() {
			this.page++;
			if (this.page >= this.count) {
				this.first();
			}
		},
		last() {
			this.page = this.count - 1;
		}
	}

});