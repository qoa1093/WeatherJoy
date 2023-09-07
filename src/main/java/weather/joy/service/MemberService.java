package weather.joy.service;

import java.util.List;

import weather.joy.domain.Criteria;
import weather.joy.domain.MemberVO;

public interface MemberService {
	public List<MemberVO> getUserList();
	public String register(MemberVO user);
	public MemberVO getRead(String userid);
	public int modify(MemberVO user);
	public int delete(long memNum);
	public int getTotal(Criteria cri);
	public List<MemberVO> getList(Criteria cri);
}
