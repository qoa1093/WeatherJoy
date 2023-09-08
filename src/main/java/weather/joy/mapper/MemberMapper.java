package weather.joy.mapper;


import java.util.List;
import weather.joy.domain.Criteria;
import weather.joy.domain.MemberVO;
import weather.joy.domain.SocialVO;

public interface MemberMapper {
	
		public List<MemberVO> getUserList();
		
		public List<MemberVO> getListWithPaging(Criteria cri);
		
		public int getTotalCount(Criteria cri);
		
		public void insertUser(MemberVO user);
		
		//public void insertSelectKey(UserVO user);
		
		public MemberVO read(String userid);
		
		public int delete(long memNum);
		
		public int update(MemberVO user);
		
		public long insertUserNum(MemberVO user);
		
		public void deleteUserNum(long memNum);

		public MemberVO selectMemberId(String memId);

		public void insertSocialUser(SocialVO kakao);
		
}
