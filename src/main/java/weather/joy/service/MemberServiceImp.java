package weather.joy.service;


import java.util.List;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import weather.joy.domain.Criteria;
import weather.joy.domain.MemberVO;
import weather.joy.mapper.MemberMapper;



@Service
@AllArgsConstructor
@Log4j
public class MemberServiceImp implements MemberService{
	private MemberMapper mapper;
	
	@Override
	public List<MemberVO> getUserList(){
		
		return mapper.getUserList();
	}
	@Override
	public List<MemberVO> getList(Criteria cri){
		return mapper.getListWithPaging(cri);
	}
	
	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}
	
	@Override
	public String register(MemberVO user) { 
		log.info("register......"+user);
		
		mapper.insertUser(user);
		 
		String i = user.getMemId(); 
		return i;
	}
	@Override
	public MemberVO getRead(String userid){
		log.info("getList.....");
		return mapper.read(userid);
	}
	
	@Override
	public int modify(MemberVO user) { 
		log.info("modify......"+user);
		
		 //MemberVO user1 = mapper.read(user);
		return mapper.update(user);
	}
	//id로 삭제할지 memNum으로 삭제할지 고려해볼것 
	@Override
	public int delete(long memNum) { 
		log.info("remove......"+memNum);
		
		return mapper.delete(memNum);
	}
	@Override
	public MemberVO getMemId(String memId) {
		if(memId == null)
			return null;
		return mapper.selectMemberId(memId);
	}
}
