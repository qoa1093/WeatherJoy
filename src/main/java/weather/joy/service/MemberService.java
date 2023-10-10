package weather.joy.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import weather.joy.domain.Criteria;
import weather.joy.domain.MemberVO;
import weather.joy.domain.SocialVO;

public interface MemberService {
	public List<MemberVO> getUserList();
	public String register(MemberVO user);
	public MemberVO getRead(String userid);
	public int modify(MemberVO user);
	public int delete(long memNum);
	public int getTotal(Criteria cri);
	public List<MemberVO> getList(Criteria cri);
	public MemberVO getMemId(String memId);
	public SocialVO getSocialData(String code);
	public MemberVO getmember(long memNum);
	public String getReadID(@Param("memName")String memName, @Param("memEmail")String memEmail);
	//public MemberVO signIn(MemberVO user);
}
