require 'spec_helper'
describe Userinfo do
  before do
    @user1 = User.new('username1', 'password', 'name1_surname1')
  end
  it 'have username' do
    expect(@user1.user_info.username).to eql('username1')
  end
  it 'have password' do
    expect(@user1.user_info.password).to eql('password')
  end
  it 'have name and surname' do
    expect(@user1.user_info.name_surname).to eql('name1_surname1')
  end
end
