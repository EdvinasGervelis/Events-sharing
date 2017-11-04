require '/home/edvinas/Desktop/Events-sharing/lib/event.rb'
require '/home/edvinas/Desktop/Events-sharing/lib/user_messages.rb'
## user class additional information
class Useractivity
  attr_reader :messages, :event, :friends, :user_object
  def initialize(user_object)
    @messages = UserMessages.new()
    @user_object = user_object
    @event = 0
    @friends = []
  end

  def create_event
    @event += 1

  end

  def add_friend(friend_object)
    friend_object.user_activity.add_request_message(user_object)
  end

  def get_friend(username)
    friends.find { |frnd| username.eql? frnd.user_info.username }
  end

  def add_request_message(user)
    messages.request_messages << user # {}"#{user.user_info.username} want to connect"
  end

  def friend_request_message(index)
   
    message = "#{messages.request_messages.fetch(index).user_info.username} want to connect with you"
    @messages.request_messages[index] = nil
    message
  end

  def decline_friend_request(index)
    @messages.request_messages[index] = nil
  end

  def accept_friend_request(friend_object)
    friends << friend_object
    friend_object.user_activity.friends << user_object
  end
end
