package com.kh.ifwe.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ifwe.admin.model.dao.AdminDAO;
import com.kh.ifwe.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminDAO adminDAO;
	
	@Override
	public List<Member> selectMemberList(int cPage, int numPerPage) {
		return adminDAO.selectMemberList(cPage,numPerPage);
	}

	@Override
	public List<Member> selectDropMemberList(int cPage, int numPerPage) {
		return adminDAO.selectDropMemberList(cPage,numPerPage);
	}

	@Override
	public List<Member> selectDormantMemberList(int cPage, int numPerPage) {
		return adminDAO.selectDormantMemberList(cPage, numPerPage);
	}

	@Override
	public Member selectOne(int memberCode) {
		return adminDAO.selectOne(memberCode);
	}

	@Override
	public int cancelMember(Member member, int memberCode) {
		return adminDAO.cancelMember(member, memberCode);
	}



	
}
