class BankAccount

  attr_reader :balance, :transaction, :transaction_history

  def initialize
    @balance = 0
    @transaction_history = []
  end

  def deposit(date:, credit:)
    @balance += credit

    @transaction = {}
    @transaction[:date] = date
    @transaction[:credit] = credit
    @transaction[:debit] = 0
    @transaction[:balance] = @balance
  end

  def withdrawal(date:, debit:)
    @balance -= debit

    @transaction = {}
    @transaction[:date] = date
    @transaction[:credit] = 0
    @transaction[:debit] = debit
    @transaction[:balance] = @balance
  end

  def record_transaction
    @transaction_history << @transaction
  end
end
