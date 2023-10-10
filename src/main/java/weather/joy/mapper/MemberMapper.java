package weather.joy.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import weather.joy.domain.Criteria;
import weather.joy.domain.MemberVO;
import weather.joy.domain.SocialVO;

public interface MemberMapper {
	
		public List<MemberVO> getUserList();
		
		public List<MemberVO> getListWithPaging(Criteria cri);
		
		public int getTotalCount(Criteria cri);
		
		public void insertUser(MemberVO user);
		
		public void insertAuth(String memId);
		
		//public void insertSelectKey(UserVO user);
		
		public MemberVO read(String userid);
		
		public MemberVO readMember(String userid);
		
		public int delete(long memNum);
		
		public int update(MemberVO user);
		
		public long insertUserNum(MemberVO user);
		
		public void deleteUserNum(long memNum);

		public MemberVO selectMemberId(String memId);

		public void insertSocialUser(SocialVO kakao);

		public SocialVO getSocial(@Param("soEmail")String soEmail, @Param("snsType")String snsType);
		
		public MemberVO selectMember(long memNum);
		
		public int updatePw(@Param("memPw")String memPw , @Param("memEmail")String memEmail);
		
		public String getReadID(@Param("memName")String memName, @Param("memEmail")String memEmail);
}
