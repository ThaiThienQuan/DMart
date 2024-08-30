package dmart.serviceImplement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dmart.entity.Account;
import dmart.entity.Authority;
import dmart.repository.AccountRepository;
import dmart.repository.AuthorityRepository;
import dmart.service.AuthorityService;

@Service
public class AuthorityServiceImplement implements AuthorityService{
	@Autowired
	AuthorityRepository dao;
	@Autowired
	AccountRepository acDao;

	
	public Authority create(Authority auth) {
		return dao.save(auth);
	}


	
	public List<Authority> findAll() {
		
		return dao.findAll();
	}


	
	public void delete(Integer id) {
		dao.deleteById(id);
	}
	
	public List<Authority> findAuthoritiesOfAdministrators() {
		List<Account> accounts = acDao.getAdministrators();
		return dao.authoritiesOf(accounts);
	}

}
