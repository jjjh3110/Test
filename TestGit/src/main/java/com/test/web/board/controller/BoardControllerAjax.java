package com.test.web.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.web.board.bean.BoardReplyBean;
import com.test.web.board.service.BoardService;
import com.test.web.common.Constants;
import com.test.web.common.bean.PagingBean;

@Controller
public class BoardControllerAjax {

	@Autowired
	private BoardService boardService;

	@RequestMapping("/board/boardDetailViewForm")
	public String boardDetailViewForm() {
		return "/board/boardDetailViewForm";
	}
	
	//게시글 상세보기 AJAX
	@RequestMapping("/board/boardDetailViewAjax")
	@ResponseBody
	public Map<String, Object> boardDetailViewAjax(PagingBean pBean) {

		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "게시글 상세보기 조회 실패");

		try {
			//게시글 통합조회(댓글 목록까지 조회)
			resMap = boardService.selectBoardReplyInfo(pBean);
			resMap.put(Constants.RESULT, Constants.RESULT_OK);
			resMap.put(Constants.RESULT_MSG, "게시글 상세보기 조회 성공");
		} catch(Exception e) {
			e.printStackTrace();
		}

		return resMap;
	}
	//게시글 상세보기 AJAX
	@RequestMapping("/board/boardReplyAjax")
	@ResponseBody
	public Map<String, Object> boardReplyAjax(PagingBean pBean) {
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "게시글 상세보기 조회 실패");
		
		try {
			//게시글 통합조회(댓글 목록까지 조회)
			List<BoardReplyBean> list = boardService.selectBoardReplyList(pBean);
			resMap.put("boardReplyList", list);
			resMap.put(Constants.RESULT, Constants.RESULT_OK);
			resMap.put(Constants.RESULT_MSG, "게시글 상세보기 조회 성공");
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return resMap;
	}




}
