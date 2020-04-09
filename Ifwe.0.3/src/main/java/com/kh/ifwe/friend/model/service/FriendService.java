package com.kh.ifwe.friend.model.service;

import java.util.List;
import java.util.Map;

import com.kh.ifwe.friend.model.vo.Friend;
import com.kh.ifwe.member.model.vo.FriendList;
import com.kh.ifwe.member.model.vo.Member;
import com.kh.ifwe.member.model.vo.Message;

public interface FriendService {

	int insertFriendRequest(Friend friend);

	int updateFriendAccept(Friend friend);

	int DeleteFriendAccetp(Friend friend);

	List<FriendList> selectListFriend(int memberCode);

	List<Friend> selectOneFriend(int memberCode);

	List<Message> selectMsgList(Map<String, Object> param);

	int insertMsgSend(Message message);

	int updateMsg(int msgCode);


}
