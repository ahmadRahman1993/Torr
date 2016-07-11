package webproject.springmvc.service;

import static org.mockito.Matchers.any;
import static org.mockito.Matchers.anyString;
import static org.mockito.Matchers.anyInt;
import static org.mockito.Mockito.atLeastOnce;
import static org.mockito.Mockito.doNothing;
import static org.mockito.Mockito.verify;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import static org.mockito.Mockito.when;

import org.joda.time.LocalDate;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.Spy;
import org.testng.Assert;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

import webproject.springmvc.dao.UserDao;
import webproject.springmvc.model.User;

public class UserServiceImplTest {

	@Mock
	UserDao dao;
	
	@InjectMocks
	UserServiceImpl userService;
	
	@Spy
	List<User> users = new ArrayList<User>();
	
	@BeforeClass
	public void setUp(){
		MockitoAnnotations.initMocks(this);
		users = getUserList();
	}

	@Test
	public void findById(){
		User usr = users.get(0);
		when(dao.findById(anyInt())).thenReturn(usr);
		Assert.assertEquals(userService.findById(usr.getId()),usr);
	}

	/*@Test
	public void saveUser(){
		doNothing().when(dao).save(any(User.class));
		User usr =new User();
		usr.setId(3);
		usr.setFirstName("sufyan");
		usr.setLastName("shahid");
		usr.setSsoId("sus");
		usr.setEmail("sus@venturedive.com");
		usr.setPassword("venturedive123");
		userService.saveUser(usr);
		verify(dao, atLeastOnce()).save(any(User.class));
	}*/
	
	@Test
	public void updateUser(){
		User usr = users.get(0);
		when(dao.findById(anyInt())).thenReturn(usr);
		userService.updateUser(usr);
		verify(dao, atLeastOnce()).findById(anyInt());
	}

	@Test
	public void deleteUserBySSO(){
		doNothing().when(dao).deleteBySSO(anyString());
		userService.deleteUserBySSO(anyString());
		verify(dao, atLeastOnce()).deleteBySSO(anyString());
	}
	
	@Test
	public void findAllUsers(){
		when(dao.findAllUsers()).thenReturn(users);
		Assert.assertEquals(userService.findAllUsers(), users);
	}
	
	@Test
	public void findUserBySSO(){
		User usr = users.get(0);
		when(dao.findBySSO(anyString())).thenReturn(usr);
		Assert.assertEquals(userService.findBySSO(anyString()), usr);
	}

	@Test
	public void isUserSSOUnique(){
		User usr = users.get(0);
		when(dao.findBySSO(anyString())).thenReturn(usr);
		Assert.assertEquals(userService.isUserSSOUnique(usr.getId(), usr.getSsoId()), true);
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
