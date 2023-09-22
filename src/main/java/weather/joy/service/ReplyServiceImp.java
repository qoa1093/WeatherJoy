package weather.joy.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import weather.joy.domain.Criteria;
import weather.joy.domain.ReplyPageDTO;
import weather.joy.domain.ReplyVO;
import weather.joy.mapper.BoardMapper;
import weather.joy.mapper.ReplyMapper;



@Service
//@AllArgsConstructor
@Log4j
public class ReplyServiceImp implements ReplyService{
	@Setter(onMethod_ = {@Autowired})
	private ReplyMapper mapper;
	
	@Setter(onMethod_ = {@Autowired})
	private BoardMapper boardMapper;
	
	
	
	@Override
	public List<ReplyVO> getList(Criteria cri, long bno){
		log.info("getList....." + bno);
		return mapper.getListWithPaging(cri, bno);
	}
	@Override
	public ReplyPageDTO getListPage(Criteria cri, long bno) {
		return new ReplyPageDTO(
				mapper.getCountByBno(bno),
				mapper.getListWithPaging(cri, bno));
	}
	/*
	@Transactional	  
	@Override public int register(ReplyVO vo) { 
		log.info("register......"+vo);
		boardMapper.updateReplyCnt(vo.getBno(), 1); 
		return mapper.insert(vo); 
	}
	@Override
	public ReplyVO get(long rno) { 
		log.info("get......"+rno);
		
		return mapper.read(rno);
	}
	
	@Override
	public int modify(ReplyVO reply) { 
		log.info("modify......"+reply);
		
		return mapper.update(reply);
	}
	@Transactional
	@Override
	public int remove(long rno) { 
		log.info("remove......"+rno);
		ReplyVO vo = mapper.read(rno);
		
		boardMapper.updateReplyCnt(vo.getBno(), -1);
		
		return mapper.delete(rno);
	}
*/
}
