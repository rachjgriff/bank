require_relative 'bank_statement'
require_relative 'bank_balance'

class BankAccount

  attr_reader :transaction_history, :bank_statement, :bank_balance

  def initialize(bank_statement = BankStatement.new, bank_balance = BankBalance.new)
    @transaction_history = []
    @bank_statement = bank_statement
    @bank_balance = bank_balance
  end

  def record_transaction
    @transaction_history << @bank_balance.transaction
  end

  def print_bank_statement
    @bank_statement.create_bank_statement(@transaction_history)
  end
end
