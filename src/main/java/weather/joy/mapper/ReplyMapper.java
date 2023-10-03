package weather.joy.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import weather.joy.domain.Criteria;
import weather.joy.domain.ReplyVO;


public interface ReplyMapper {
	public int insert(ReplyVO vo);
	public ReplyVO read(long rno);
	public int delete(long targetRno);
	public int update(ReplyVO reply);
	public List<ReplyVO> getListWithPaging(@Param("cri") Criteria cri, @Param("bdNum") long bdNum);
	public int getCountByBno(long bdNum);
	
}
