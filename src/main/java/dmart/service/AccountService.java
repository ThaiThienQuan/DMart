package dmart.service;

import java.util.List;
import java.util.Optional;

import dmart.entity.Account;

public interface AccountService {

	public Account findById(String username);

	public List<Account> getAdministrators();

	public List<Account> findAll();

	Account create(Account Account);

	public Optional<Account> findbyEmailAccount(String email);

	public boolean authenticate(String username, String password);

	public void changePassword(String username, String newPassword);

	public Account update(Account account);

	public void delete(String username);
	public boolean existsByUsername(String username);
	public boolean existsByEmail(String email) ;
}
