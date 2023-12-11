app.controller("reportController", function($scope, $http){

	$scope.reportDate = 0;
	$scope.reportMonth = 0;
	$scope.reportYear = 0;
	$scope.reportNumber = 0;
	$scope.dataTable = [];
	$scope.dataTableOrder = [];
	$scope.year =  new Date().getFullYear();
	$scope.month =  new Date().getMonth() + 1;

	var data = {
		labels: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'],
		datasets: [{
			label: 'Doanh thu bán hàng',
			borderColor: 'rgb(75, 192, 192)',
			data: [],
			fill: true,
		}]
	};

	// Tùy chọn của biểu đồ
	var options = {
		scales: {
			y: {
				beginAtZero: true
			}
		}
	};

	// Lấy thẻ canvas
	var ctx = document.getElementById('myChart').getContext('2d');

	// Tạo biểu đồ đường
	var myLineChart = new Chart(ctx, {
		type: 'line',
		data: data,
		options: options
	});

	$http.get("/rest/orders/reportByDate").then(resp => {
		$scope.reportDate = resp.data;
	});
	
	$http.get("/rest/orders/reportByMonth").then(resp => {
		$scope.reportMonth = resp.data;
	});

	$http.get("/rest/orders/reportByYear").then(resp => {
		$scope.reportYear = resp.data;
	});

	$http.get("/rest/orders/reportByMonthNumber").then(resp => {
		$scope.reportNumber = resp.data;
	});

	$scope.filterYear = function (){
		if($scope.yearOp == null){
			return;
		}else{
			$scope.loadChartLineYear($scope.yearOp);
		}
	}

	$scope.loadChartLineYear = function(year){
		$http.get("/rest/orders/sp_reportByYear/" + year).then(resp => {
			var totaldata = [];
			for(var i = 0; i < resp.data.length; i ++){
				totaldata.push(resp.data[i][1]);
			}
	
			// Gán dữ liệu mới cho datasets của biểu đồ
			myLineChart.data.datasets[0].data = totaldata;
	
			// Cập nhật biểu đồ
			myLineChart.update();
		});
	}
	//Khi load xong sẽ hiện dữ liệu nay hiện tại
	$scope.loadChartLineYear(new Date().getFullYear());

	// Khởi tạo giá trị mặc định cho selectedOption
    $scope.selectedOption = "0";

    // Hàm xử lý khi giá trị dropdown thay đổi
    $scope.onOptionChange = function() {
        // Kiểm tra giá trị và thực hiện các hành động tương ứng
        if ($scope.selectedOption === "0") {
            // Xử lý khi chọn "Top 10 sản phẩm bán chạy"
            $scope.top10Product(0);
        } else if ($scope.selectedOption === "1") {
			// Xử lý khi chọn "Top 10 sản phẩm bán không chạy"
            $scope.top10Product(1);
        }
    };

	$scope.top10Product = function (value){
		if(value == 0){
			$http.get("/rest/orders/GetTop10BestSellingProducts").then(resp => {
				$scope.dataTable = resp.data;
			});
		}else{
			$http.get("/rest/orders/GetTop10LeastSellingProducts").then(resp => {
				$scope.dataTable = resp.data;
			});
		}
	}
	//Hiện khi vừa load lên
	$scope.top10Product(0);
	

	$scope.orderDate = function (){
		if($scope.getDate == null){
			return;
		}else{
			$scope.loadOrderDate($scope.getDate);
		}
	}

	$scope.loadOrderDate = function(date){
		$http.get("/rest/orders/orderDate/" + date).then(resp => {
			$scope.dataTableOrder = resp.data;
		});
	}
	$scope.loadOrderDate(new Date());
});