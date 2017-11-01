require 'spec_helper'
describe Transaction do
  before do
    @user1 = User.new('username1', 'password', 'name1_surname1')
    @user1.set_bank_information('card_number', 'bank_acc_number')
    @user2 = User.new('username2', 'password', 'name1_surname1')
    @user2.set_bank_information('card_number', 'bank_acc_number')
  end
  it 'have card number' do
    expect(@user1.transaction.card_number).to eql('card_number')
  end
  it 'have bank account number' do
    expect(@user1.transaction.bank_acc_number).to eql('bank_acc_number')
  end
  it 'can pay for events' do
    balance = @user1.transaction.balance
    @user1.transaction.pay_for_event(10, @user2)
    expect(@user1.transaction.balance).to eql(balance - 10)
  end
  it 'can get money for sold event ticket' do
    balance = @user1.transaction.balance
    @user1.transaction.pay_for_event(10, @user2)
    expect(@user2.transaction.balance).to eql(balance + 10)
  end
  it 'can check balance' do
    expect(@user1.transaction.balance).to eql(0)
  end
  it 'can withdraw money' do
    @user1.transaction.increase_money(10)
    expect(@user1.transaction.withdraw_money(10)).to eql(0)
  end
end
