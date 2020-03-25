package com.kh.ifwe.friend.model.service;

import java.util.List;

import com.kh.ifwe.friend.model.vo.Friend;

public interface FriendService {

	int insertFriendRequest(Friend friend);

	int updateFriendAccept(Friend friend);

	int DeleteFriendAccetp(Friend friend);

	List<Friend> selectListFriend(int memberCode);

}
