package dmart.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;

import dmart.entity.OrderDetail;

public interface OrderDetailDAO extends JpaRepository<OrderDetail, Integer> {
	@Query("SELECT SUM(od.price * od.quantity) AS DoanhThu FROM OrderDetail od WHERE  od.order.createDate = ?1")
    Object reportByDate(Date date);

    @Query("SELECT SUM(od.price * od.quantity) AS DoanhThu FROM OrderDetail od WHERE YEAR(od.order.createDate) = :years")
    Object reportByYear(@Param("years") int years);

    @Query("SELECT SUM(od.price * od.quantity) AS DoanhThu FROM OrderDetail od WHERE MONTH(od.order.createDate) = :month")
    Object reportByMonth(@Param("month") int month);

    @Query("SELECT COUNT(od.quantity) AS DoanhThu FROM OrderDetail od WHERE MONTH(od.order.createDate) = :month")
    Long reportByMonthNumber(@Param("month") int month);

    @Procedure("GetRevenueByMonth")
    List<Object> sp_reportByYear(int year);

    @Procedure("GetTop10BestSellingProducts")
    List<Object> GetTop10BestSellingProducts();

    @Procedure("GetTop10LeastSellingProducts")
    List<Object> GetTop10LeastSellingProducts();
}
