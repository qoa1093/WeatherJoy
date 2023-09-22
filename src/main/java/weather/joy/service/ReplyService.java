package weather.joy.service;

import java.util.List;

import weather.joy.domain.Criteria;
import weather.joy.domain.ReplyPageDTO;
import weather.joy.domain.ReplyVO;



public interface ReplyService {
	
	//public int register(ReplyVO reply);
	public List<ReplyVO> getList(Criteria cri, long bno);
	public ReplyPageDTO getListPage(Criteria cri, long bno);
	/*
	public ReplyVO get(long rno);
	public int modify(ReplyVO reply);
	public int remove(long rno);
	//public List<ReplyVO> getList();
	*/
}
