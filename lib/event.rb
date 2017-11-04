require '/home/edvinas/Desktop/Events-sharing/lib/event_information.rb'
require '/home/edvinas/Desktop/Events-sharing/lib/event_ticket.rb'
# event class
class Event 
  attr_reader :accesability, :event_ticket, :event_information, :participants
  def initialize(event_name, location, date, price, accesability, organizator)
    @event_ticket = EventTicket.new(event_name, location, date, price)
    @event_information = EventInformation.new(organizator)
    @accesability = accesability
    @participants = []
  end

end





