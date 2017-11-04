require '/home/edvinas/Desktop/Events-sharing/lib/event_information.rb'
require '/home/edvinas/Desktop/Events-sharing/lib/event_ticket.rb'
require '/home/edvinas/Desktop/Events-sharing/lib/user.rb'
require '/home/edvinas/Desktop/Events-sharing/lib/transaction.rb'
# event class
class Event 
  attr_reader :accessability, :ticket, :information, :participants
  def initialize(event_name, location, date, price, accesability, organizator)
    @ticket = EventTicket.new(event_name, location, date, price)
    @information = EventInformation.new(organizator)
    @accessability = accesability
    @participants = []
  end

  def sell_ticket(buyer_object)
    buyer_object.transaction.pay_for_event(ticket.price, information.organizator)
    information.increase_balance(ticket.price)
    participants << buyer_object
    buyer_object.tickets << ticket
  end

  def invite_user(user_object)
    user_object.tickets << ticket
    user_object.user_activity.user_messages.messages << "#{information.organizator} invited you to #{ticket.event_name} event"
    participants << user_object
  end

  def add_review(review)
    information.reviews << review
  end

end

