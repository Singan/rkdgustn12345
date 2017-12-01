package com.naver.member.serviceImp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.member.service.FriendService;
import com.naver.repository.domain.Friend;
import com.naver.repository.mapper.FriendMapper;

@Service
public class FriendServiceImpl implements FriendService{
	
	@Autowired
	FriendMapper friendMapper;

	@Override
	public List<Friend> selectFriend(int memberNo) throws Exception {
		return friendMapper.selectFriend(memberNo);
	}

	@Override
	public List<Friend> selectFriendRequest(int memberNo) throws Exception {
		return friendMapper.selectFriendRequest(memberNo);
	}

	@Override
	public List<Friend> selectFriendResponse(int memberNo) throws Exception {
		return friendMapper.selectFriendResponse(memberNo);
	}

	@Override
	public void insertFriendRequest(Friend friend) throws Exception {
		friendMapper.insertFriendRequest(friend);
	}

	@Override
	public void insertFriendAccept(Friend friend) throws Exception {
		friendMapper.insertFriendAccept(friend);
	}

	@Override
	public void updateFriendAccept(Friend friend) throws Exception {
		friendMapper.updateFriendAccept(friend);
	}

	@Override
	public void deleteFriend(Friend friend) throws Exception {
		friendMapper.deleteFriend(friend);
	}
	
}
