require 'spec_helper.rb'
describe EventTicket do

  before do
    @ticket = EventTicket.new('event_name', 'location', 'date', 1)
  end
  it 'have name' do
    expect(@ticket.event_name).to eql('event_name')
  end
  it 'have location' do
    expect(@ticket.location).to eql('location')
  end
  it 'have its date' do
    expect(@ticket.date).to eql('date')
  end
  it 'have its price' do
    expect(@ticket.price).to eql(1)
  end

end