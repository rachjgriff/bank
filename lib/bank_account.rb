require_relative 'bank_statement'
require_relative 'bank_balance'

class BankAccount

  attr_reader :bank_balance

  def initialize(bank_statement = BankStatement.new,
      bank_balance = BankBalance.new)
    @bank_statement = bank_statement
    @bank_balance = bank_balance
  end

  def print_bank_statement
    @bank_statement.create_bank_statement(@bank_balance.transaction_history)
  end
end
