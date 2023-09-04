package weather.joy.mapper;


import java.util.List;
import weather.joy.domain.Criteria;
import weather.joy.domain.MemberVO;

public interface MemberMapper {
	
		public List<MemberVO> getUserList();
		
		public List<MemberVO> getListWithPaging(Criteria cri);
		
		public int getTotalCount(Criteria cri);
		
		public void insertUser(MemberVO user);
		
		//public void insertSelectKey(UserVO user);
		
		public MemberVO read(String userid);
		
		public int delete(String userid);
		
		public int update(MemberVO user);
		
		public long insertUserNum(MemberVO user);
		
		public void deleteUserNum(long memNum);
		
}
