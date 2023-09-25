package weather.joy.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import weather.joy.domain.BoardAttachVO;
import weather.joy.domain.BoardVO;
import weather.joy.domain.Criteria;
import weather.joy.domain.MemberVO;
import weather.joy.mapper.BoardAttachMapper;
import weather.joy.mapper.BoardMapper;
import weather.joy.mapper.MemberMapper;



@Service
@Log4j
public class BoardServiceImp implements BoardService{
	@Setter(onMethod_ = {@Autowired})
	private BoardMapper mapper;
	
	@Setter(onMethod_ = {@Autowired})
	private BoardAttachMapper attachMapper;
	
	@Setter(onMethod_ = {@Autowired})
	private MemberMapper membermapper;
	@Transactional
	@Override
	public long register(BoardVO board) { 
		log.info("register......");
		
		long num = membermapper.read(board.getWriter()).getMemNum();
		board.setMemNum(num); 
		mapper.insertOpstar(board);
		long num2 = board.getOpBdNum();
		log.info("optin:"+board);
		mapper.insertSelectKey(board);
		if(board.getAttachList() == null || board.getAttachList().size() <=0) {
			
			return -1;
		}
		board.getAttachList().forEach(attach->{
			
			attach.setBdNum(board.getBdNum());
			attachMapper.insert(attach);
		});
		
		return 1;		
		 
	}

	
	@Override
	public List<BoardVO> getList(){
		log.info("getList.....");
		return mapper.getList();
	}
	
	
	
	
	
	@Transactional
	@Override
	public boolean modify(BoardVO board) { 
		log.info("modify......"+board);
		attachMapper.deleteAll(board.getBdNum());
		boolean modifyResult = mapper.update(board) ==1;
		if(modifyResult&&board.getAttachList() != null && board.getAttachList().size() >0) {
			board.getAttachList().forEach(attach->{
				
				attach.setBdNum(board.getBdNum());
				attachMapper.insert(attach);
			});
		}
		return modifyResult;
	}
	@Transactional
	@Override
	public int remove(long bdNum) { 
		log.info("remove......"+bdNum);
		attachMapper.deleteAll(bdNum);
		return mapper.delete(bdNum);
	}
	@Override
	public int deleteWriter(String writer) {
		long memNum = (membermapper.read(writer)).getMemNum();
		int i = mapper.deleteWriter(memNum);
		log.info("delete many:---------" + i);
		return i;
	}
	@Override
	public List<BoardAttachVO> getAttachList(long bdNum){
		return attachMapper.findByBno(bdNum);
	}
	/*
	*/
	
	@Override
	public List<BoardVO> getList(Criteria cri){
		log.info("getList.....");
		log.info(mapper.getReviewListWithPaging(cri));
		List<BoardVO> list = mapper.getListWithPaging(cri);
		for(BoardVO vo:list) {
			String name = membermapper.selectMember(vo.getMemNum()).getMemId();
			log.info("이름"+name);
			vo.setWriter(name);
			BoardVO b = mapper.getRead(vo.getBdNum());
			log.info("별"+b.getOpStar());
			vo.setOpStar(b.getOpStar());
		}
		log.info(list);
		return list; 
	}
	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		
		return mapper.getTotalCount(cri);
	}
	
	@Override
	public BoardVO get(long bdNum) { 
		log.info("get......"+bdNum);
		BoardVO vo = mapper.read(bdNum);
		vo = mapper.getRead(bdNum);
		log.info(vo);
		String name = membermapper.selectMember(vo.getMemNum()).getMemId();
		log.info("이름"+name);
		vo.setWriter(name);
		return vo;
	}
	
}
