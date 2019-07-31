require_relative 'bank_statement'

class BankAccount

  attr_reader :balance, :transaction, :transaction_history

  def initialize(bank_statement = BankStatement.new)
    @balance = 0
    @transaction_history = []
    @bank_statement = bank_statement
  end

  def deposit(date:, credit:)
    @balance += credit

    # Move to private as deposit_transaction
    # Test what deposit_transaction returns
    @transaction = {}
    @transaction[:date] = date
    @transaction[:credit] = '%.2f' % credit
    @transaction[:debit] = ""
    @transaction[:balance] = '%.2f' % @balance
  end

  def withdrawal(date:, debit:)
    @balance -= debit

    # Move to private as withdrawal_transaction
    # Test what deposit_transaction returns
    @transaction = {}
    @transaction[:date] = date
    @transaction[:credit] = ""
    @transaction[:debit] = '%.2f' % debit
    @transaction[:balance] = '%.2f' % @balance
  end

  def record_transaction
    @transaction_history << @transaction
  end

  # ADD METHOD TO PRINT STATEMENT - @bank_statement.print_bank_statement
  def print_bank_statement
    @bank_statement.create_bank_statement(@transaction_history)
  end
end
