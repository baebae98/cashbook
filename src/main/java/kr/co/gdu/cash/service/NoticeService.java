package kr.co.gdu.cash.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.co.gdu.cash.mapper.CashbookMapper;
import kr.co.gdu.cash.mapper.NoticeMapper;
import kr.co.gdu.cash.mapper.NoticefileMapper;
import kr.co.gdu.cash.vo.Notice;
import kr.co.gdu.cash.vo.NoticeForm;
import kr.co.gdu.cash.vo.Noticefile;

@Service
@Transactional
public class NoticeService {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	//
	private final String PATH = "D:\\javawork\\spring-work\\cashbook\\src\\main\\webapp\\upload\\";
	
	@Autowired private NoticeMapper noticeMapper;
	@Autowired private CashbookMapper  cashbookMapper;
	@Autowired private NoticefileMapper noticefileMapper;
	
	//
	/*public int addNotice(Notice notice) {
			return noticeMapper.insertNotice(notice);
	}*/
	public void addNotice(NoticeForm noticeForm) {
		Notice notice = new Notice();
		notice.setNoticeTitle(noticeForm.getNoticeTitle());
		notice.setNoticeContent(noticeForm.getNoticeContent());
		//1.Notice
		noticeMapper.insertNotice(notice);
		
		List<Noticefile> noticefile = null;
		if(noticeForm.getNoticefileList()!=null) {
			noticefile = new ArrayList<Noticefile>();
			for(MultipartFile mf : noticeForm.getNoticefileList()) {
				Noticefile nf = new Noticefile();
				nf.setNoticeId(notice.getNoticeId());
				int p = mf.getOriginalFilename().lastIndexOf(".");
				String ext = mf.getOriginalFilename().substring(p).toLowerCase();
				String filename=UUID.randomUUID().toString().replace("-","");
				nf.setNoticefileName(filename+ext);
				nf.setNoticefileSize(mf.getSize());
				nf.setNoticefileType(mf.getContentType());
				noticefile.add(nf);
				logger.debug("for臾� : "+nf);
				try {
					mf.transferTo(new File(PATH+filename+ext));
					
				}catch(Exception e) {
					e.printStackTrace();
					throw new RuntimeException();
				}
			}
		}
		if(noticefile != null) {
			for(Noticefile nf : noticefile) {
				noticefileMapper.insertNoticefile(nf);
			}
		}
	}
	
	//
	/*public void removeNotice(int noticeId) {
		noticeMapper.deleteNotice(noticeId);
	}*/
	public void removeNotice(int noticeId) {
		//1.
		List<String> noticefileNameList = noticefileMapper.selectNoticeFileNameList(noticeId);
		for(String s: noticefileNameList) {
			File file = new File(PATH+s);
			if(file.exists()) {
				file.delete();
			}
		}
		//2.
		noticefileMapper.deleteNoticefile(noticeId);
		//3.
		noticeMapper.deleteNotice(noticeId);
	}
	//
	public void removeFile(Noticefile noticefile) {
		int noticefileId = noticefile.getNoticefileId();
		String noticefileName = noticefile.getNoticefileName();
		
		//
		File file = new File(PATH+noticefileName);
		
		//
		if(file.exists()) {
			file.delete();
		}
		
		noticefileMapper.deleteNoticefile(noticefileId);
	}
	
	//
	public int modifyNotice(Notice notice) {
		 return noticeMapper.updateNotice(notice);
		
		
	}
	//
	public Notice getNoticeOne(int noticeId) {
		Notice notice = noticeMapper.selectNoticeOne(noticeId);
		return notice;
	}
	//
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
	 * issue: 
	 */
	public Map<String,Object> getNoticeAndInOutList() {
	       List<Notice> noticeList = noticeMapper.selectLastestNoticeList();
	       List<Map<String,Object>> inOutList = cashbookMapper.selectCashInOutList();
	       Map<String,Object> map = new HashMap<String,Object>();
	       map.put("noticeList",  noticeList);
	       map.put("inOutList", inOutList);
	       return map;
	     
	   }
	
	//
	public List<Notice> getNoticeList(){
		return noticeMapper.selectLastestNoticeList();
	}
}
