class BankAccount

  attr_reader :balance, :transaction, :transactions

  def initialize
    @balance = 0
    @transaction = {date: "", credit: 0, debit: 0, balance: 0}
    @transactions = []
  end

  def deposit(date: ,credit: )
    @balance += credit
    @transaction[:date] = date
    @transaction[:credit] = credit
    @transaction[:balance] = @balance
  end
  #
  # def withdraw(money)
  #   @balance -= money
  # end
end
