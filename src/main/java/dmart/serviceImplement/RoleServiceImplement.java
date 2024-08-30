package dmart.serviceImplement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dmart.entity.Role;
import dmart.repository.RoleRepository;
import dmart.service.RoleService;

@Service
public class RoleServiceImplement implements RoleService{
	@Autowired
	RoleRepository roleDAO;

	@Override
	public List<Role> getAll() {
	
		return roleDAO.findAll();
	}
	
	
}
