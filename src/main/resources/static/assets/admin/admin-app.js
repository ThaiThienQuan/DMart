app = angular.module("admin-app",["ngRoute"]);

app.config(function ($routeProvider){
	$routeProvider
	.when("/product",{
		templateUrl:"/assets/admin/product/index.html",
		controller:"product-ctrl"
	})
	.when("/authorize",{
		templateUrl:"/assets/admin/authority/index.html",
		controller:"authority-ctrl"
	})
	.when("/user",{
		templateUrl:"/assets/admin/user/User.html",
		controller:"user-ctrl"
	})
	.when("/unthorized",{
		templateUrl:"/assets/admin/authority/unauthorized.html",
		controller:"authority-ctrl"
	})
	.when("/thongke",{
		templateUrl:"/assets/admin/thongke/index.html",
		controller:"reportController"
	}).otherwise({
        redirectTo: "/product"
    });
})