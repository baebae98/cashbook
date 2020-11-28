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
	//파일지정경로
	private final String PATH = "D:\\javawork\\spring-work\\gitspringowrk\\cash\\cash\\src\\main\\webapp\\upload\\";
	
	//aws 업로드시 사용하는 경로
	//private final String PATH = "/var/lib/tomcat9/webapps/cash/upload/";
	
	@Autowired private NoticeMapper noticeMapper;
	@Autowired private CashbookMapper  cashbookMapper;
	@Autowired private NoticefileMapper noticefileMapper;
	
	//공지사항추가
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
		//1.공지사항을 참조하는 파일들을 삭제
		List<String> noticefileNameList = noticefileMapper.selectNoticeFileNameList(noticeId);
		for(String s: noticefileNameList) {
			File file = new File(PATH+s);
			if(file.exists()) {
				file.delete();
			}
		}
		//2.공지사항을 참조하는 파일 테이블 데이터삭제
		noticefileMapper.deleteNoticefile(noticeId);
		//3.공지사항 삭제
		noticeMapper.deleteNotice(noticeId);
	}
	//파일삭제
	public void removeFile(Noticefile noticefile) {
		int noticefileId = noticefile.getNoticefileId();
		String noticefileName = noticefile.getNoticefileName();
		
		//파일 경로, 이름 지정
		File file = new File(PATH+noticefileName);
		
		//파일 있는 경우
		if(file.exists()) {
			file.delete();
		}
		
		noticefileMapper.deleteNoticefileOne(noticefileId);
	}
	
	//공지사항 수정
	/*public int modifyNotice(Notice notice) {
		 return noticeMapper.updateNotice(notice);
		
		
	}*/
	public void updateNotice(NoticeForm noticeForm) {
		Notice notice = new Notice();
		notice.setNoticeId(noticeForm.getNoticeId());
		notice.setNoticeTitle(noticeForm.getNoticeTitle().replaceAll("(?i)<script", "&lt;script"));
		notice.setNoticeContent(noticeForm.getNoticeContent().replaceAll("(?i)<script", "&lt;script"));
		notice.setNoticeDate(noticeForm.getNoticeDate());
		noticeMapper.updateNotice(notice);
		
		List<Noticefile> noticefile =null;
		
		//파일을 추가해서 nullx
		//파일을 추가하는 부분은 addNotice와 동일함
		if(noticeForm.getNoticefileList() !=null) {
			noticefile = new ArrayList<Noticefile>();
			for(MultipartFile mf : noticeForm.getNoticefileList()) {
				Noticefile nf = new Noticefile();
				
				nf.setNoticeId(notice.getNoticeId());
				
				int p = mf.getOriginalFilename().lastIndexOf(".");
				String ext = mf.getOriginalFilename().substring(p).toLowerCase();
				String filename = UUID.randomUUID().toString().replace("-", "");
				
				nf.setNoticefileName(filename+ext);
				nf.setNoticefileSize(mf.getSize());
				nf.setNoticefileType(mf.getContentType());
				
				noticefile.add(nf);
				
				logger.debug("for 문" +nf);
				try {
					mf.transferTo(new File(PATH+filename+ext));
				}catch(Exception e) {
					e.printStackTrace();
					throw new RuntimeException();
				}
			}
		}
		if(noticefile !=null) {
			for(Noticefile nf : noticefile) {
				noticefileMapper.insertNoticefile(nf);
			}
		}
	}
	//공지사항 상세보기
	public Notice getNoticeOne(int noticeId) {
		Notice notice = noticeMapper.selectNoticeOne(noticeId);
		return notice;
	}
	//공지사항 목록 페이징
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
	 *  issue: 중복되는 코드가 있음. : noticeMapper.selectLastestNoticeList(); 추후 분리/제거해야함.
	 */
	public Map<String,Object> getNoticeAndInOutList() {
	       List<Notice> noticeList = noticeMapper.selectLastestNoticeList();
	       List<Map<String,Object>> inOutList = cashbookMapper.selectCashInOutList();
	       Map<String,Object> map = new HashMap<String,Object>();
	       map.put("noticeList",  noticeList);
	       map.put("inOutList", inOutList);
	       return map;
	     
	   }
	
	//메인페이지 공지사항
	public List<Notice> getNoticeList(){
		return noticeMapper.selectLastestNoticeList();
	}
}
