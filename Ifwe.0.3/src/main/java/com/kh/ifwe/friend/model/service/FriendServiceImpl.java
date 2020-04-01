package com.kh.ifwe.friend.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ifwe.friend.model.dao.FriendDAO;
import com.kh.ifwe.friend.model.vo.Friend;
import com.kh.ifwe.member.model.vo.FriendList;
import com.kh.ifwe.member.model.vo.Member;

@Service
public class FriendServiceImpl implements FriendService {

	
	@Autowired
	FriendDAO friendDAO;

	@Override
	public int insertFriendRequest(Friend friend) {
		// TODO Auto-generated method stub
	
				int result=friendDAO.insertFriendRequest(friend);

	return result;
	}

	@Override
	public int updateFriendAccept(Friend friend) {
		// TODO Auto-generated method stub
		return friendDAO.updateFriendAccept(friend);
	}

	@Override
	public int DeleteFriendAccetp(Friend friend) {
		// TODO Auto-generated method stub
		return friendDAO.DeleteFriendAccept(friend);
	}

	@Override
	public List<FriendList> selectListFriend(int memberCode) {
		// TODO Auto-generated method stub
		return friendDAO.selectListFreind(memberCode);
	}

	
}
