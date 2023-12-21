package com.lab8.serviceImplement;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lab8.entity.Account;
import com.lab8.repository.AccountRepository;
import com.lab8.service.AccountService;

@Service
public class AccountServiceImplement implements AccountService {
	@Autowired
	AccountRepository accountDAO;

	@Override
	public Account findById(String username) {
		Account account = accountDAO.findById(username).get();
		return account;
	}

	@Override
	public Account create(Account Account) {
		return accountDAO.save(Account);
	}

	@Override
	public Account update(Account Account) {
		// TODO Auto-generated method stub
		return accountDAO.save(Account);
	}

	@Override
	public void delete(String username) {
		accountDAO.deleteById(username);

	}

	@Override
	public List<Account> getAdministrators() {
		return accountDAO.getAdministrators();
	}

	@Override
	public List<Account> findAll() {
		return accountDAO.findAll();
	}

	public Optional<Account> findbyEmailAccount(String email) {
		return accountDAO.findByEmail(email);
	}

	public boolean authenticate(String username, String password) {
		try {
			// Lấy thông tin tài khoản từ cơ sở dữ liệu
			Account account = accountDAO.findById(username).orElse(null);

			// Kiểm tra xem tài khoản có tồn tại và mật khẩu khớp không
			return account != null && password.equals(account.getPassword());
		} catch (Exception e) {
			// Xử lý ngoại lệ nếu cần thiết
			e.printStackTrace();
		}

		return false;
	}

	public void changePassword(String username, String newPassword) {
		try {
			// Lấy thông tin tài khoản từ cơ sở dữ liệu
			Account account = accountDAO.findById(username).orElse(null);

			// Kiểm tra xem tài khoản có tồn tại không
			if (account != null) {
				// Cập nhật mật khẩu mới
				account.setPassword(newPassword);
				accountDAO.save(account);
			}
		} catch (Exception e) {
			// Xử lý ngoại lệ nếu cần thiết
			e.printStackTrace();
		}
	}

}
