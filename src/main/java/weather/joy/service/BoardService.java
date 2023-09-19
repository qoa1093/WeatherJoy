package weather.joy.service;

import java.util.List;

import weather.joy.domain.BoardAttachVO;
import weather.joy.domain.BoardVO;
import weather.joy.domain.Criteria;



public interface BoardService {
	public List<BoardVO> getList(Criteria cri);
	public int getTotal(Criteria cri);
	public BoardVO get(long bdNum);
	/*public long register(BoardVO board);
	public int remove(long bno);
	public boolean modify(BoardVO board);
	//public List<BoardVO> getList();
	public int deleteWriter(String writer);
	
	public List<BoardAttachVO> getAttachList(Long bdNum);*/
}
