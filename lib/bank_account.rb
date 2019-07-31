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
    deposit_transaction(date, credit)
  end

  def withdrawal(date:, debit:)
    @balance -= debit
    withdrawal_transaction(date, debit)
  end

  def record_transaction
    @transaction_history << @transaction
  end

  def print_bank_statement
    @bank_statement.create_bank_statement(@transaction_history)
  end

  private

  def deposit_transaction(date, credit)
    @transaction = {}
    @transaction[:date] = date
    @transaction[:credit] = '%.2f' % credit
    @transaction[:debit] = ""
    @transaction[:balance] = '%.2f' % @balance
  end

  def withdrawal_transaction(date, debit)
    @transaction = {}
    @transaction[:date] = date
    @transaction[:credit] = ""
    @transaction[:debit] = '%.2f' % debit
    @transaction[:balance] = '%.2f' % @balance
  end
end
