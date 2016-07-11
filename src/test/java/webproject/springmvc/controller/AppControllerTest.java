package webproject.springmvc.controller;

import static org.mockito.Matchers.any;
import static org.mockito.Matchers.anyString;
import static org.mockito.Matchers.anyInt;
import static org.mockito.Mockito.doNothing;
import static org.mockito.Mockito.when;
import static org.mockito.Mockito.verify;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.joda.time.LocalDate;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.Spy;
import static org.mockito.Mockito.atLeastOnce;

import org.springframework.context.MessageSource;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.testng.Assert;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;


import webproject.springmvc.model.User;
import webproject.springmvc.service.UserService;

public class AppControllerTest {

	@Mock
	UserService service;
	
	@Mock
	MessageSource message;
	
	@InjectMocks
	AppController appController;
	
	@Spy
	List<User> users = new ArrayList<User>();

	@Spy
	ModelMap model;
	
	@Mock
	BindingResult result;
	
	@BeforeClass
	public void setUp(){
		MockitoAnnotations.initMocks(this);
		users = getUserList();
	}
	
	@Test
	public void listUsers(){
		appController.initTesting();
		when(service.findAllUsers()).thenReturn(users);
		Assert.assertEquals(appController.listUsers(model), "userslist");
		Assert.assertEquals(model.get("users"), users);
		verify(service, atLeastOnce()).findAllUsers();
		appController.doneTesting();
	}
	
	@Test
	public void newUser(){
		appController.initTesting();
		Assert.assertEquals(appController.newUser(model), "registration");
		Assert.assertNotNull(model.get("user"));
		Assert.assertFalse((Boolean)model.get("edit"));
		//Assert.assertEquals(Integer.valueOf(((User)model.get("user")).getId()), Integer.valueOf(0));
		appController.doneTesting();
	}


	@Test
	public void saveUserWithValidationError(){
		appController.initTesting();
		when(result.hasErrors()).thenReturn(true);
		doNothing().when(service).saveUser(any(User.class));
		Assert.assertEquals(appController.saveUser(users.get(0), result, model), "registration");
		appController.doneTesting();
	}

	@Test
	public void saveUserWithValidationErrorNonUniqueSSN(){
		appController.initTesting();
		when(result.hasErrors()).thenReturn(false);
		when(service.isUserSSOUnique(anyInt(), anyString())).thenReturn(false);
		Assert.assertEquals(appController.saveUser(users.get(0), result, model), "registration");
		appController.doneTesting();
	}

	
	@Test
	public void saveUserWithSuccess(){
		appController.initTesting();
		when(result.hasErrors()).thenReturn(false);
		when(service.isUserSSOUnique(anyInt(), anyString())).thenReturn(true);
		doNothing().when(service).saveUser(any(User.class));
		Assert.assertEquals(appController.saveUser(users.get(0), result, model), "registrationsuccess");
		appController.doneTesting();
	}

	@Test
	public void editUser(){
		appController.initTesting();
		User usr = users.get(0);
		when(service.findBySSO(anyString())).thenReturn(usr);
		Assert.assertEquals(appController.editUser("ahr", model), "registration");
		Assert.assertNotNull(model.get("user"));
		Assert.assertTrue((Boolean)model.get("edit"));
		Assert.assertEquals(Integer.valueOf(((User)model.get("user")).getId()), Integer.valueOf(1));
		appController.doneTesting();
	}

	@Test
	public void updateUserWithValidationError(){
		appController.initTesting();
		when(result.hasErrors()).thenReturn(true);
		doNothing().when(service).updateUser(any(User.class));
		Assert.assertEquals(appController.updateUser(users.get(0), result, model,""), "registration");
		appController.doneTesting();
	}

	@Test
	public void updateUserWithValidationErrorNonUniqueSSN(){
		appController.initTesting();
		when(result.hasErrors()).thenReturn(false);
		when(service.isUserSSOUnique(anyInt(), anyString())).thenReturn(false);
		Assert.assertEquals(appController.updateUser(users.get(0), result, model,""), "registrationsuccess");
		appController.doneTesting();
	}

	@Test
	public void updateUserWithSuccess(){
		appController.initTesting();
		when(result.hasErrors()).thenReturn(false);
		when(service.isUserSSOUnique(anyInt(), anyString())).thenReturn(true);
		doNothing().when(service).updateUser(any(User.class));
		Assert.assertEquals(appController.updateUser(users.get(0), result, model, ""), "registrationsuccess");
		appController.doneTesting();
	}
	
	
	@Test
	public void deleteUser(){
		appController.initTesting();
		doNothing().when(service).deleteUserBySSO(anyString());
		Assert.assertEquals(appController.deleteUser("mur"), "redirect:/list");
		appController.doneTesting();
	}

	public List<User> getUserList(){
		User u1 = new User();
		u1.setId(1);
		u1.setFirstName("Ahmad");
		u1.setLastName("Rahman");
		u1.setSsoId("ahr");
		u1.setPassword("netpace123");
		u1.setEmail("ahr@netpace.com");
		
		User u2 = new User();
		u2.setId(2);
		u2.setFirstName("Muhammad");
		u2.setLastName("Rahman");
		u2.setSsoId("mur");
		u2.setPassword("netpace123");
		u2.setEmail("mur@netpace.com");
		
		users.add(u1);
		users.add(u2);
		return users;
	}
}
