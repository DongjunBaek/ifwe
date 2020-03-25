package com.kh.ifwe.friend.model.dao;

import java.util.List;

import com.kh.ifwe.friend.model.vo.Friend;

public interface FriendDAO {



	int insertFriendRequest(Friend friend);

	int updateFriendAccept(Friend friend);

	int DeleteFriendAccept(Friend friend);

	List<Friend> selectListFreind(int memberCode);

}
