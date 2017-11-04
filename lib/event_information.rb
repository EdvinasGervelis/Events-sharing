class EventInformation
  attr_reader :organizator, :description, :reviews
  def initialize(organizator)
  	@organizator = organizator
  	@reviews = []
  end
  
end