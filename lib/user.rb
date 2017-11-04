require '/home/edvinas/Desktop/Events-sharing/lib/transaction.rb'
require '/home/edvinas/Desktop/Events-sharing/lib/userinfo.rb'
require '/home/edvinas/Desktop/Events-sharing/lib/user_activity.rb'
# User class describes users information and its functionality
class User
  attr_reader :user_info, :transaction, :user_activity, :tickets
  def initialize(username, password, name_surname)
    @user_info = Userinfo.new(name_surname, username, password)
    @user_activity = Useractivity.new(self)
    @tickets = []
  end

  def set_bank_information(card_number, bank_acc_number)
    @transaction = Transaction.new(card_number, bank_acc_number)
  end
end
