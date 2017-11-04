require 'spec_helper.rb'
describe EventInformation do
  before do
    @user = User.new('username1', 'password', 'name1_surname1')
    @event_information = EventInformation.new(@user)
  end
  it 'have organizator' do
    expect(@event_information.organizator).to eql(@user)
  end
  it 'have description' do
    expect(@event_information.description).to eql(nil)
  end
  it 'have reviews' do
     expect(@event_information.reviews).to eql([])
  end

end