require 'transaction'
require 'userinfo'
require 'user_activity'
# User class describes users information and its functionality
# hajsdh
#asdsad
class User
  attr_reader :user_info, :transaction, :user_activity
  def initialize(username, password, name_surname)
    @user_info = Userinfo.new(name_surname, username, password)
    @user_activity = Useractivity.new(self)
  end

  def set_bank_information(card_number, bank_acc_number)
    @transaction = Transaction.new(card_number, bank_acc_number)
  end
end
