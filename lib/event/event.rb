class Event 
  attr_reader :accesability, :event_name, :event_information, :participants
  initialize(event_name, location, date, price, accesability, organizator)
    @event_ticket = EventTicket.new(evnt_name, location, date, price)
    @event_information = EventInformation.new(organizator)
    @accesability = accesability
    @participants = []
  end

  def buy_ticket(buyer_objec)
  	
  end

end