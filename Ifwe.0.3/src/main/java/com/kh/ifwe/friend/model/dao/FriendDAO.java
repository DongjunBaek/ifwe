package com.kh.ifwe.friend.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.ifwe.friend.model.vo.Friend;
import com.kh.ifwe.member.model.vo.FriendList;
import com.kh.ifwe.member.model.vo.Member;
import com.kh.ifwe.member.model.vo.Message;

public interface FriendDAO {



	int insertFriendRequest(Friend friend);

	int updateFriendAccept(Friend friend);

	int DeleteFriendAccept(Friend friend);

	List<FriendList> selectListFreind(int memberCode);

	List<Friend> selectOneFriend(int memberCode);

	List<Message> selectMsgList(Map<String, Object> param);

	int insertMsgSend(Message message);

	int updateMsg(int msgCode);

}
