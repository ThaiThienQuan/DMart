package com.lab8.serviceImplement;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lab8.entity.Role;
import com.lab8.repository.RoleRepository;
import com.lab8.service.RoleService;

@Service
public class RoleServiceImplement implements RoleService{
	@Autowired
	RoleRepository roleDAO;

	@Override
	public List<Role> getAll() {
	
		return roleDAO.findAll();
	}
	
	
}
