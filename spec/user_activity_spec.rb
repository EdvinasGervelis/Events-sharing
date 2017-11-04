require '/home/edvinas/Desktop/Events-sharing/spec/spec_helper'
describe Useractivity do
  before do
    @user1 = User.new('username1', 'password', 'name1_surname1')
    @user2 = User.new('username2', 'password', 'name1_surname1')
    @user3 = User.new('username3', 'password', 'name2_surname2')
  end
  it 'have friend request message' do
    expect(@user1.user_activity.friend_request_message).to eql(nil)
  end
  it 'can create an event' do
    @user1.user_activity.create_event
    expect(@user1.user_activity.event).to eql(1)
  end
  it 'can send friend request to another user' do
    @user1.user_activity.add_friend(@user2)
    expect(@user2.user_activity.friend_request_message)
      .to eql("#{@user1.user_info.username} want to connect")
  end
  it 'can read friend request message' do
    @user1.user_activity.add_friend(@user2)
    @user2.user_activity.friend_request_message
    expect(@user2.user_activity.friend_request_message).to eql(nil)
  end
  it 'can accept friend request' do
    @user1.user_activity.add_friend(@user2)
    @user2.user_activity.accept_friend_request(@user1)
    expect(@user2.user_activity.get_friend('username1')).to eql(@user1)
  end
  it 'friend list will increase if its friend request message is accepted' do
    @user1.user_activity.add_friend(@user2)
    @user1.user_activity.add_friend(@user3)
    @user1.user_activity.accept_friend_request(@user1)
    @user3.user_activity.accept_friend_request(@user1)
    expect(@user1.user_activity.get_friend('username3')).to eql(@user3)
  end
  it 'can decline friend request' do
    @user1.user_activity.add_friend(@user2)
    @user2.user_activity.decline_friend_request
    expect(@user2.user_activity.friend_request_message).to eql(nil)
  end
  it 'will not add friend to its friends list if friend request is declined' do
    @user1.user_activity.add_friend(@user2)
    @user2.user_activity.decline_friend_request
    expect(@user1.user_activity.get_friend('username2')).to eql(nil)
  end
end
