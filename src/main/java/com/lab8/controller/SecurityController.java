package com.lab8.controller;

import java.util.List;
import java.util.Optional;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lab8.entity.Account;
import com.lab8.repository.AccountRepository;
import com.lab8.service.AccountService;
import com.lab8.service.EmailService;

@Controller
public class SecurityController {
	@Autowired
	AccountRepository dao;

	@Autowired
	AccountService accountService;

	@Autowired
	EmailService emailService;

	@RequestMapping("/security/login/form")
	public String loginForm(Model model) {
		model.addAttribute("message", "Vui lòng đăng nhập");
		return "security/login";
	}

	@RequestMapping("/security/signup/form")
	public String signupForm(Model model) {
		Account Account = new Account();
		model.addAttribute("Account", Account);
		List<Account> Accounts = dao.findAll();
		model.addAttribute("Accounts", Accounts);
		model.addAttribute("message", "Vui lòng đăng nhập");
		return "security/signup";
	}

	@RequestMapping("/security/signup/form/create")
	public String create(Model model, Account Account) {
		emailService.sendEmail(Account.getEmail(), "Chào mừng",
				"Rất vui vì bạn đã đăng ký tài khoản tại website chúng tôi Link website chúng tôi: http://localhost:8080/security/login/form");
		dao.save(Account);
		return "redirect:/security/login/form";
	}

	@RequestMapping("/security/login/success")
	public String loginSuccess(Model model) {
		model.addAttribute("message", "Đăng nhập thành công");
		return "redirect:/product/list";
	}

	@RequestMapping("/security/login/err")
	public String loginError(Model model) {
		model.addAttribute("message", "Sai thông tin đăng nhập!");
		return "security/login";
	}

	@RequestMapping("/security/unauthoried")
	public String unauthoried(Model model) {
		model.addAttribute("message", "Không có quyền truy vấn~");
		return "security/login";
	}

	@RequestMapping("/security/logoff/success")
	public String logoffSuccess(Model model) {
		model.addAttribute("message", "Bạn đã đăng xuất");
		return "security/login";
	}

	@RequestMapping("/security/forgot-password/form")
	public String forgotPasswordForm(Model model) {
		return "security/forgot-password";
	}

	@PostMapping("/security/forgot-password")
	public String forgotPassword(@RequestParam("email") String email, Model model) {
		// Kiểm tra xem email có tồn tại trong hệ thống hay không
		Optional<Account> optionalAccount = accountService.findbyEmailAccount(email);

		if (optionalAccount.isPresent()) {
			// Lấy giá trị từ Optional
			Account account = optionalAccount.get();

			// Tạo mật khẩu mới
			String newPassword = generateNewPassword();

			// Cập nhật mật khẩu trong cơ sở dữ liệu
			account.setPassword(newPassword);
			dao.save(account);

			// Gửi mật khẩu mới đến địa chỉ email
			sendNewPasswordByEmail(email, newPassword);
			model.addAttribute("message", "Mật khẩu đã được gửi đến địa chỉ email của bạn.");
			// Chuyển hướng đến trang thông báo gửi mật khẩu thành công
			return null;
		} else {
			// Chuyển hướng đến trang thông báo email không tồn tại
			model.addAttribute("message", "Email không tồn tại trong hệ thống.");
			return null;
		}
	}

	@RequestMapping("/security/forgot-password/success")
	public String forgotPasswordSuccess(Model model) {
		return "security/forgot-password";
	}

	@RequestMapping("/security/forgot-password/email-not-found")
	public String forgotPasswordNotFound(Model model) {
		return "security/forgot-password";
	}

	private String generateNewPassword() {
		// Logic để tạo một mật khẩu mới (có thể sử dụng thư viện để tạo mật khẩu ngẫu
		// nhiên)
		// ...
		Random random = new Random();
		StringBuilder newPassword = new StringBuilder();

		for (int i = 0; i < 5; i++) {
			int digit = random.nextInt(10); // Tạo một số ngẫu nhiên từ 0 đến 9
			newPassword.append(digit);
		}
		System.out.println(newPassword.toString());
		return newPassword.toString();
	}

	private void sendNewPasswordByEmail(String email, String newPassword) {
		// Gửi mật khẩu mới đến địa chỉ email
		emailService.sendEmail(email, "Mật khẩu mới", "Mật khẩu mới của bạn là: " + newPassword);
	}
}
