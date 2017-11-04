require '/home/edvinas/Desktop/Events-sharing/spec/spec_helper'
describe Useractivity do
  before do
    @user1 = User.new('username1', 'password', 'name1_surname1')
    @user2 = User.new('username2', 'password', 'name1_surname1')
    @user3 = User.new('username3', 'password', 'name2_surname2')
  end
  #it 'have friend request message' do
  #  expect(@user1.user_activity.friend_request_message).to eql(nil)
  #end
  it 'can create an event' do
    @user1.user_activity.create_event('event_name', 'location', 'date', 1, 'public')
    expect(@user1.user_activity.events[0]).not_to be(nil)
  end
  it 'created event have name' do
    @user1.user_activity.create_event('event_name', 'location', 'date', 1, 'public')
    expect(@user1.user_activity.events[0].ticket.event_name).to eql('event_name')
  end
  it 'created event have location' do
    @user1.user_activity.create_event('event_name', 'location', 'date', 1, 'public')
    expect(@user1.user_activity.events[0].ticket.location).to eql('location')
  end
  it 'created event have date' do
    @user1.user_activity.create_event('event_name', 'location', 'date', 1, 'public')
    expect(@user1.user_activity.events[0].ticket.date).to eql('date')
  end
  it 'created event have price' do
    @user1.user_activity.create_event('event_name', 'location', 'date', 1, 'public')
    expect(@user1.user_activity.events[0].ticket.price).to eql(1)
  end
  it 'created event have accessability' do
    @user1.user_activity.create_event('event_name', 'location', 'date', 1, 'public')
    expect(@user1.user_activity.events[0].accessability).to eql('public')
  end
  it 'created event have organizator' do
    @user1.user_activity.create_event('event_name', 'location', 'date', 1, 'public')
    expect(@user1.user_activity.events[0].information.organizator).to eql(@user1)
  end
  it 'can send friend request to another user' do
    @user1.user_activity.add_friend(@user2)
    expect(@user2.user_activity.friend_request_message(0))
      .to include("#{@user1.user_info.username} want to connect")
  end
  it 'can read friend request message' do
    @user1.user_activity.add_friend(@user2)
    @user2.user_activity.friend_request_message(0)
    expect(@user2.user_activity.user_messages.request_messages[0]).to eql(nil)
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
    @user2.user_activity.decline_friend_request(0)
    expect(@user2.user_activity.user_messages.request_messages[0]).to eql(nil)
  end
  it 'will not add friend to its friends list if friend request is declined' do
    @user1.user_activity.add_friend(@user2)
    @user2.user_activity.decline_friend_request(0)
    expect(@user1.user_activity.get_friend('username2')).to eql(nil)
  end
end
