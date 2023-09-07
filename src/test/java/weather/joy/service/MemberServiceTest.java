package weather.joy.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import lombok.Setter;
import lombok.extern.log4j.Log4j;
import weather.joy.domain.MemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberServiceTest {
	
	@Setter(onMethod_ = {@Autowired})
	private MemberService service;
	
	@Test
	public void testExist() {
		log.info("서비스 ____"+service);
		assertNotNull(service);
	}
	
	@Test
	public void testRegister() {
		MemberVO user = new MemberVO();
		
		user.setMemId("user007");
		user.setMemName("김유저4");
		user.setMemPw("user007!");
		user.setMemAddr("경북 구미시");
		user.setMemPhone("01023445522");
		
		service.register(user);
		
		log.info("----------------- 생성된 유저아이디 :"+user.getMemId());
	}
	
	
	@Test
	public void testGetRead() {
		log.info("1줄 ____"+service.getRead("user007"));
		
	}
	
	@Test
	public void testDelete() {
		log.info("delete ____"+service.delete(56));
		
	}
	@Test
	public void testUpdate() {
		MemberVO user = service.getRead("user006");
		if(user == null) return;
		user.setMemName("수정");
		log.info("modify ____"+service.modify(user));
		
	}
	
	@Test
	public void testGetList() {
		service.getUserList().forEach(user -> log.info(user));
	}
}
