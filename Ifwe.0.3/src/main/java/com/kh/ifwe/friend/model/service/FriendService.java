package com.kh.ifwe.friend.model.service;

import java.util.List;

import com.kh.ifwe.friend.model.vo.Friend;
import com.kh.ifwe.member.model.vo.FriendList;
import com.kh.ifwe.member.model.vo.Member;

public interface FriendService {

	int insertFriendRequest(Friend friend);

	int updateFriendAccept(Friend friend);

	int DeleteFriendAccetp(Friend friend);

	List<FriendList> selectListFriend(int memberCode);

	Friend selectOneFriend(int memberCode);


}
