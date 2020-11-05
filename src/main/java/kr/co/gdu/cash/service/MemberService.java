package kr.co.gdu.cash.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.mapper.MemberMapper;
import kr.co.gdu.cash.vo.Member;

@Service
@Transactional
public class MemberService {
	@Autowired private MemberMapper memberMapper;
	
	public Member getMemberById(Member paramMember) {
		Member member = memberMapper.selectMemberById(paramMember.getId());
		if(member != null && member.getPw().equals(paramMember.getPw())==true) {
			return member;
		}
		return null;
	}
	
	/*간단한게 쓰는 방법 (위에는 보기 불편함. 이 코드는 보기 편함.)
	 * if(member !=null && member.getPw().equals(pw)==true){
		return member;
		
		}
	return null;
	}	*/
}
