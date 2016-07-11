package webproject.springmvc.dao;

import java.math.BigDecimal;

import org.dbunit.dataset.IDataSet;
import org.dbunit.dataset.xml.FlatXmlDataSet;
import org.joda.time.LocalDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.testng.Assert;
import org.testng.annotations.Test;

import webproject.springmvc.model.User;


public class UserDaoImplTest extends EntityDaoImplTest{

	@Autowired
	UserDao userDao;

	@Override
	protected IDataSet getDataSet() throws Exception{
		IDataSet dataSet = new FlatXmlDataSet(this.getClass().getClassLoader().getResourceAsStream("User.xml"));
		return dataSet;
	}

	@Test
	public void findById(){
		Assert.assertNotNull(userDao.findById(1));
		Assert.assertNull(userDao.findById(3));
	}

	
	@Test
	public void saveUser(){
		userDao.save(getSampleUser());
		Assert.assertEquals(userDao.findAllUsers().size(), 3);
	}
	
	@Test
	public void deleteBySSO(){
		userDao.deleteBySSO("mur");
		Assert.assertEquals(userDao.findAllUsers().size(), 1);
	}
	
	@Test
	public void deleteByInvalidSSO(){
		userDao.deleteBySSO("dgf");
		Assert.assertEquals(userDao.findAllUsers().size(), 2);
	}

	@Test
	public void findAllUsers(){
		Assert.assertEquals(userDao.findAllUsers().size(), 2);
	}
	
	@Test
	public void findBySSO(){
		Assert.assertNotNull(userDao.findBySSO("ahr"));
		Assert.assertNull(userDao.findBySSO("14545"));
	}

	public User getSampleUser(){
		User u2 = new User();
		//u2.setId(3);
		u2.setFirstName("Bilal");
		u2.setLastName("Latif");
		u2.setSsoId("bil");
		u2.setPassword("systems123");
		u2.setEmail("bil@systems.com");
		return u2;
	}

}
