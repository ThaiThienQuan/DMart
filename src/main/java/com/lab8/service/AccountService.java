package com.lab8.service;

import java.util.List;
import java.util.Optional;

import com.lab8.entity.Account;

public interface AccountService {

	public Account findById(String username);

	public List<Account> getAdministrators();

	public List<Account> findAll();

	Account create(Account Account);

	public Optional<Account> findbyEmailAccount(String email);

	public boolean authenticate(String username, String password);

	public void changePassword(String username, String newPassword);
}
