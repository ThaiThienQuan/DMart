package com.lab8.rest.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.lab8.entity.Account;
import com.lab8.entity.Product;
import com.lab8.service.AccountService;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/Accounts")
public class AccountRestController {
	@Autowired
	AccountService accountService;
	@GetMapping()
	public List<Account> getAll(){
		return accountService.findAll();
	}
	@PostMapping
	public Account create(@RequestBody Account Account) {
		return accountService.create(Account);
	}

	@PutMapping("/{username}")
	public Account update(@PathVariable("username") String username, @RequestBody Account Account) {
		return accountService.update(Account);
	}

	@DeleteMapping("/{username}")
	public void delete(@PathVariable("username") String username) {
		accountService.delete(username);
	}
}
