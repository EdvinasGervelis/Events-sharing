require 'spec_helper'
describe Event do
    
  before do
    @user1 = User.new('username1', 'password', 'name1_surname1')
    @user1.set_bank_information('card_number', 'bank_acc_number')
    @user2 = User.new('username2', 'password', 'name2_surname2')
    @user2.set_bank_information('card_number', 'bank_acc_number')
    @event = Event.new('event_name', 'location', '2001-01-01', 1, 'public', @user1)
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
    expect(@event.event_information.organizator).to eql(@user1)
  end
  it 'have its participnats' do
    expect(@event.participants).to eql([])
  end
  it 'organizator get money for sold ticket' do
    @event.sell_ticket(@user2)
    expect(@user1.transaction.balance).to eql(1)
  end
  it 'add money ti its balance if ticket is sold' do
    @event.sell_ticket(@user2)
    expect(@event.event_information.event_balance).to eql(1)
  end
  it 'ticket buyer will appear in participants list' do
    @event.sell_ticket(@user2)
    expect(@event.participants).to include(@user2)
  end
  it 'ticket will appeat in buyer ticket list' do
    @event.sell_ticket(@user2)
    expect(@user2.tickets).to include(@event.event_ticket)
  end
  it 'will send message to ivited user' do
    @event.invite_user(@user2)
    expect(@user2.user_activity.messages.messages[0]).to eql("#{@event.event_information.organizator} invited you to #{@event.event_ticket.event_name} event")
  end
  it 'ivited user will appear in participants list' do
     @event.invite_user(@user2)
     expect(@event.participants).to include(@user2)
  end
  it 'ticket will appear in in invited users tickets list' do
     @event.invite_user(@user2)
     expect(@user2.tickets).to include(@event.event_ticket)
  end

end