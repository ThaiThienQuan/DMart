package dmart.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import dmart.entity.Role;

public interface RoleRepository extends JpaRepository<Role, String>{

}
