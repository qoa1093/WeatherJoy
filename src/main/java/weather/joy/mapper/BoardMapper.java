package weather.joy.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import weather.joy.domain.BoardVO;
import weather.joy.domain.Criteria;


public interface BoardMapper {
	public List<BoardVO> getListWithPaging(Criteria cri);
	public List<BoardVO> getReviewListWithPaging(Criteria cri);
	public int getTotalCount(Criteria cri);
	
	//@Select("select * from tbl_board where bno>0")
	/*public List<BoardVO> getList();
	
	
	public void insert(BoardVO board);
	
	public void insertSelectKey(BoardVO board);
	
	public BoardVO read(long bdNum);
	
	public int delete(long bdNum);
	
	public int update(BoardVO board);
	//writer는 num으로 보내온 값을 넣어줘야 함
	//public ArrayList<BoardVO> readWriter(String writer);
	
	public int deleteWriter(long memNum);
	
	
	public List<BoardVO> searchTest(Map<String, Map<String, String>> map);
	
	public void updateReplyCnt(@Param("bdNum")long bdNum, @Param("amount")int amount);*/
}
