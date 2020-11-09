package kr.co.gdu.cash.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.mapper.CashbookMapper;
import kr.co.gdu.cash.mapper.NoticeMapper;
import kr.co.gdu.cash.vo.Notice;

@Service
@Transactional
public class NoticeService {
	@Autowired private NoticeMapper noticeMapper;
	@Autowired private CashbookMapper  cashbookMapper;
	
	//공지사항 삭제
	public void removeNotice(int noticeId) {
		noticeMapper.deleteNotice(noticeId);
	}
	//공지사항 수정
	public int modifyNotice(Notice notice) {
		 return noticeMapper.updateNotice(notice);
		
		
	}
	//공지사항 상세보기
	public Notice getNoticeOne(int noticeId) {
		Notice notice = noticeMapper.selectNoticeOne(noticeId);
		return notice;
	}
	//공지사항 추가 
	public int addNotice(Notice notice) {
		return noticeMapper.insertNotice(notice);
	}
	
	
	//공지사항 페이징
	public Map<String, Object> getNoticeListByPage(int currentPage, int rowPerPage) {
		Map<String, Integer> paramMap = new HashMap<String, Integer>();
		paramMap.put("beginRow", (currentPage-1)*rowPerPage);
		paramMap.put("rowPerPage", rowPerPage);
		List<Notice> noticeList = noticeMapper.selectNoticeListByPage(paramMap);
		
		int noticeCount = noticeMapper.selectNoticeCount();
		int lastPage = noticeCount/rowPerPage;
		if (noticeCount%rowPerPage != 0) {
			lastPage += 1;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("noticeList", noticeList);
		map.put("lastPage", lastPage);
		return map;
	}
	   
	/*
	 * issue: 중복되는 코드가 있음. : noticeMapper.selectLastestNoticeList(); 추후 분리/제거해야함.
	 */
	public Map<String,Object> getNoticeAndInOutList() {
	       List<Notice> noticeList = noticeMapper.selectLastestNoticeList();
	       List<Map<String,Object>> inOutList = cashbookMapper.selectCashInOutList();
	       Map<String,Object> map = new HashMap<String,Object>();
	       map.put("noticeList",  noticeList);
	       map.put("inOutList", inOutList);
	       return map;
	     
	   }
	
	//공지사항
	public List<Notice> getNoticeList(){
		return noticeMapper.selectLastestNoticeList();
	}

}
