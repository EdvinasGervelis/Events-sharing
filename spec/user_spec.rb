require 'spec_helper'
describe User do
  before do
    @user1 = User.new('username1', 'password', 'name1_surname1')
    @user1.set_bank_information('card_number', 'bank_acc_number')
    @user2 = User.new('username2', 'password', 'name1_surname1')
    @user2.set_bank_information('card_number', 'bank_acc_number')
    @user3 = User.new('username3', 'password', 'name2_surname2')
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
  it 'have its activity' do
    expect(@user1.user_activity.user_object).to eql(@user1)
  end
  it 'bank information is optional' do
    expect(@user3.transaction).to be(nil)
  end
  it 'can set bank information' do
    @user3.set_bank_information('8854512', 'LT845554')
    expect(@user3.transaction).not_to be(nil)
  end
  it 'have bank account number' do
    @user3.set_bank_information('8854512', 'LT845554')
    expect(@user3.transaction.bank_acc_number).to eql('LT845554')
  end
  it 'have card number ' do
    @user3.set_bank_information('8854512', 'LT845554')
    expect(@user3.transaction.card_number).to eql('8854512')
  end
end
