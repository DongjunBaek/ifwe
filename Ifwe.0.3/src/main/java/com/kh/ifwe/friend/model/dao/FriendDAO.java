package com.kh.ifwe.friend.model.dao;

import java.util.List;

import com.kh.ifwe.friend.model.vo.Friend;
import com.kh.ifwe.member.model.vo.FriendList;
import com.kh.ifwe.member.model.vo.Member;

public interface FriendDAO {



	int insertFriendRequest(Friend friend);

	int updateFriendAccept(Friend friend);

	int DeleteFriendAccept(Friend friend);

	List<FriendList> selectListFreind(int memberCode);

}
