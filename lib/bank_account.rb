class BankAccount

  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  # def deposit(money)
  #   @balance += money
  # end
  #
  # def withdraw(money)
  #   @balance -= money
  # end
end
