package weather.joy.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import weather.joy.domain.Criteria;
import weather.joy.domain.MemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class MemberMapperTests {
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;
	
	@Setter(onMethod_ = {@Autowired})
	private MemberMapper mapper;
	
	MemberVO user = new MemberVO();
	//문제지점 : 반환되지 않는 문제 발생

	@Test
	public void testInsert() {
		
		mapper.insertUserNum(user);
		long mem= user.getMemNum();
		
		//mapper.deleteUserNum(8);
		log.info("---------"+mem);
		
		
		  user.setMemId("user007"); 
		  user.setMemName("김유저1"); 
		  user.setMemPw("user001!");
		  user.setMemAddr("경북 구미시"); 
		  user.setMemPhone("010-2344-5522");
		  user.setMemAge(27); 
		  user.setMemAValid("N"); 
		  user.setMemHobby("38,39");
		  
		  user.setMemNum(mem);
		  
		  log.info(user); 
		  mapper.insertUser(user);
		 
		 
		
		//log.info(user);
	}
	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		List<MemberVO> list = mapper.getListWithPaging(cri);
		list.forEach(board -> log.info(user));
	}
	
	@Test
	public void testRead() {
		MemberVO user = mapper.read("56");
		log.info(user);
	}
	
	@Test
	public void testDelete() {
		int a = mapper.delete(56);
		log.info("delete count:" + a);
	}
	
	@Test
	public void testUpdate() {
		
		MemberVO user = mapper.read("1234");
		
		user.setMemId("1234");
		user.setMemPw(pwencoder.encode("1234"));
		/*
		 * user.setMemName("박유저"); user.setMemAddr("충남 천안시");
		 * user.setMemPhone("010-2244-7661");
		 */
		int i = mapper.update(user);
		
		log.info("---------------count : " + i);
	}
	@Test
	public void testSearch() {
		Criteria cri = new Criteria();
		cri.setKeyword("유저");
		cri.setType("N");
		
		List<MemberVO> list = mapper.getListWithPaging(cri);
		list.forEach(user -> log.info(user));
		
	}
	
	
}
