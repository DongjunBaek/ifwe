package com.kh.ifwe.friend.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ifwe.friend.model.vo.Friend;
import com.kh.ifwe.member.model.vo.FriendList;

@Repository
public class FriendDAOImpl implements FriendDAO {

	
	@Autowired
	SqlSessionTemplate sqlsession;

	@Override
	public int insertFriendRequest(Friend friend) {
		return sqlsession.insert("friend.insertFriend",friend);
	}

	@Override
	public int updateFriendAccept(Friend friend) {
		// TODO Auto-generated method stub
		return sqlsession.update("friend.updateFriend",friend);
	}

	@Override
	public int DeleteFriendAccept(Friend friend) {
		// TODO Auto-generated method stub
		return sqlsession.delete("friend.deleteFriend",friend);
	}

	@Override
	public List<FriendList> selectListFreind(int memberCode) {
		// TODO Auto-generated method stub
		return sqlsession.selectList("friend.selectListFriend",memberCode);
	}

	@Override
	public List<Friend> selectOneFriend(int memberCode) {
		return sqlsession.selectList("friend.selectOneFriend",memberCode);
	}

	
	
	
}
