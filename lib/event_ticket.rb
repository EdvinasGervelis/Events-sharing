class EventTicket
  attr_reader :event_name, :location, :date, :price
  def initialize(event_name, location, date, price)
  	@event_name = event_name
  	@location = location
  	@date = date
  	@price = price
  end

  
end