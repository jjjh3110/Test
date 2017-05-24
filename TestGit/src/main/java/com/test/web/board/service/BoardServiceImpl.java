package com.test.web.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.web.board.bean.BoardBean;
import com.test.web.board.bean.BoardReplyBean;
import com.test.web.board.dao.BoardDao;
import com.test.web.board.dao.BoardReplyDao;
import com.test.web.common.bean.PagingBean;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao boardDao;
	@Autowired
	private BoardReplyDao boardReplyDao;
	
	
	@Override
	public BoardBean selectBoard(BoardBean bean) {
		return boardDao.selectBoard(bean);
	}

	@Override
	public List<BoardReplyBean> selectBoardReplyList(PagingBean bean) 
	{
		return boardReplyDao.selectReplyList(bean);
	}

	public Map<String, Object> selectBoardReplyInfo(PagingBean pBean) 
	{
		BoardBean bb = new BoardBean( pBean.getNo(), null );
		
		BoardBean boardBean = selectBoard(bb);
		List<BoardReplyBean> list = selectBoardReplyList(pBean);
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("boardBean", boardBean);
		resMap.put("boardReplyList", list);
		
		return resMap;
	}
	
}
