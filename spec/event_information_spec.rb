require 'spec_helper.rb'
describe EventInformation do
  before do
    @user = User.new('username1', 'password', 'name1_surname1')
    @information = EventInformation.new(@user)
  end
  it 'have organizator' do
    expect(@information.organizator).to eql(@user)
  end
  it 'have description' do
    expect(@information.description).to eql(nil)
  end
  it 'have reviews' do
     expect(@information.reviews).to eql([])
  end
  it 'have balance' do
     expect(@information.event_balance).to eql(0)
  end
  
  it 'increase event balance when ticket is sold' do
     @information.increase_balance(1)
     expect(@information.event_balance).to be(1)
  end

end