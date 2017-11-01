# transaction class
class Transaction
  attr_reader :bank_acc_number, :card_number, :balance
  def initialize(card_number, bank_acc_number)
    @bank_acc_number = bank_acc_number
    @card_number = card_number
    @balance = 0
  end

  def increase_money(sum)
    @balance += sum
  end

  def withdraw_money(sum)
    @balance -= sum
  end

  def pay_for_event(price, user_object)
    @balance -= price
    user_object.transaction.increase_money(price)
  end
end
