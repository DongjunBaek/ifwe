package com.kh.ifwe.admin.model.dao;

import java.util.List;

import com.kh.ifwe.member.model.vo.Member;

public interface AdminDAO {

	List<Member> selectMemberList(int cPage, int numPerPage);

	List<Member> selectDropMemberList(int cPage, int numPerPage);

	List<Member> selectDormantMemberList(int cPage, int numPerPage);

	Member selectOne(int memberCode);

	int cancelMember(Member member, int memberCode);

}
