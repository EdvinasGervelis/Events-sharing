class EventInformation
  attr_reader :organizator, :description, :reviews, :event_balance
  def initialize(organizator)
  	@organizator = organizator
  	@reviews = []
  	@event_balance = 0
  end

  def add_review(review)
    @reviews << review
  end

  def sell_ticket(sum)
    @event_balance += sum
  end

  
end