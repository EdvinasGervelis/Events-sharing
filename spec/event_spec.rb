require 'spec_helper'
describe Event do
    
  before do
    @user = User.new('username1', 'password', 'name1_surname1')
    @event = Event.new('event_name', 'location', '2001-01-01', 1, 'public', @user)
  end
  it 'have name' do
    expect(@event.event_ticket.event_name).to eql('event_name')
  end
  it 'have location' do
    expect(@event.event_ticket.location).to eql('location')
  end
  it 'have its date' do
    expect(@event.event_ticket.date).to eql('2001-01-01')
  end
  it 'have its price' do
    expect(@event.event_ticket.price).to eql(1)
  end
  it 'have accesability' do 
    expect(@event.accesability).to eql('public')
  end
  it 'have its organizator' do
    expect(@event.event_information.organizator).to eql(@user)
  end
  it 'have its participnats' do
    expect(@event.participants).to eql([])
  end
end