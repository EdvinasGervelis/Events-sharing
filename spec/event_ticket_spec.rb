require 'spec_helper.rb'
describe EventTicket do

  before do
    @event_ticket = EventTicket.new('event_name', 'location', 'date', 1)
  end
  it 'have name' do
    expect(@event_ticket.event_name).to eql('event_name')
  end
  it 'have location' do
    expect(@event_ticket.location).to eql('location')
  end
  it 'have its date' do
    expect(@event_ticket.date).to eql('date')
  end
  it 'have its price' do
    expect(@event_ticket.price).to eql(1)
  end

end