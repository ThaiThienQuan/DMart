package com.lab8.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "Accounts")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Account implements Serializable {
	@Id
	@NotBlank(message = "Không để trống Username")
	String username;

	@Length(min = 6, message = "Mật khẩu phải ít nhất 6 kí tự ")
	@NotBlank(message = "Không để trống Password")
	String password;

	@NotBlank(message = "Không để trống Fullname")
	String fullname;

	@NotBlank(message = "Không để trống Email")
	@Email(message = "Email không đúng định dạng")
	String email;

	String photo;
	@JsonIgnore
	@OneToMany(mappedBy = "account", cascade = CascadeType.ALL)
	List<Order> orders;

	@JsonIgnore
	@OneToMany(mappedBy = "account", fetch = FetchType.EAGER)
	List<Authority> authorities;

}
