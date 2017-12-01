package com.naver.member.service;

import java.util.List;

import com.naver.repository.domain.Friend;

public interface FriendService {
	public List<Friend> selectFriend(int memberNo) throws Exception;
	public List<Friend> selectFriendRequest(int memberNo) throws Exception;
	public List<Friend> selectFriendResponse(int memberNo) throws Exception;
	
	public void insertFriendRequest(Friend friend) throws Exception;
	public void insertFriendAccept(Friend friend) throws Exception;
	
	public void updateFriendAccept(Friend friend) throws Exception;
	
	public void deleteFriend(Friend friend) throws Exception;
}
