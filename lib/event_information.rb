class EventInformation
  attr_reader :organizator, :description, :reviews, :event_balance
  def initialize(organizator)
  	@organizator = organizator
  	@reviews = []
  	@event_balance = 0
  end

  def increase_balance(sum)
    @event_balance += sum
  end

  
end