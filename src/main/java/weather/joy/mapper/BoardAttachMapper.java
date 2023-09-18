package weather.joy.mapper;

import java.util.List;

import weather.joy.domain.BoardAttachVO;



public interface BoardAttachMapper {

	public void insert(BoardAttachVO vo);
	public void delete(String uuid);
	public List<BoardAttachVO> findByBno(long bdNum);
	public void deleteAll(long bdNum);
	public List<BoardAttachVO> getOldFiles();
}
