class EventInformation
  attr_reader :organizator, :deskription, :reviews
  def initialize(organizator, deskription)
  	@organizator = organizator
  	@deskription = deskription
  	@reviews = []
  end
end