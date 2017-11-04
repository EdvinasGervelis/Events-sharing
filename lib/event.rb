require '/home/edvinas/Desktop/Events-sharing/lib/event_information.rb'
require '/home/edvinas/Desktop/Events-sharing/lib/event_ticket.rb'
require '/home/edvinas/Desktop/Events-sharing/lib/user.rb'
require '/home/edvinas/Desktop/Events-sharing/lib/transaction.rb'
# event class
class Event 
  attr_reader :accesability, :event_ticket, :event_information, :participants
  def initialize(event_name, location, date, price, accesability, organizator)
    @event_ticket = EventTicket.new(event_name, location, date, price)
    @event_information = EventInformation.new(organizator)
    @accesability = accesability
    @participants = []
  end

  def sell_ticket(buyer_object)
    buyer_object.transaction.pay_for_event(event_ticket.price, event_information.organizator)
    event_information.sell_ticket(event_ticket.price)
    participants << buyer_object
    buyer_object.tickets << event_ticket
  end

  def invite_user(user_object)
    user_object.tickets << event_ticket
    user_object.user_activity.messages.messages << "#{event_information.organizator} invited you to #{event_ticket.event_name} event"
    participants << user_object
  end


end

