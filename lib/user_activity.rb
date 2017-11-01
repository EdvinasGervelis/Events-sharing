# user class additional information
class Useractivity
  attr_reader :request_message, :event, :friends, :user_object
  def initialize(user_object)
    @user_object = user_object
    @event = 0
    @friends = []
  end

  def create_event
    @event += 1
  end

  def add_friend(friend_object)
    friend_object.user_activity.request_message = user_object
  end

  def get_friend(username)
    friends.find { |frnd| username.eql? frnd.user_info.username }
  end

  def request_message=(user)
    @request_message = "#{user.user_info.username} want to connect"
  end

  def friend_request_message
    message = request_message
    @request_message = nil
    message
  end

  def decline_friend_request
    @request_message = nil
  end

  def accept_friend_request(friend_object)
    friends << friend_object
    friend_object.user_activity.friends << user_object
  end
end
