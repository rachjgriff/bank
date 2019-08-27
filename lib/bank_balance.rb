require_relative 'bank_transaction'

class BankBalance

  MIN_BALANCE = 0

  attr_reader :balance, :transaction_history

  def initialize(bank_transaction = BankTransaction)
    @balance = 0
    @transaction_history = []
    @bank_transaction = bank_transaction
  end

  def deposit(credit:)
    @balance += credit

    # abstract out to private method create_transaction
    bank_transaction = @bank_transaction.new
    bank_transaction.deposit_transaction(credit, balance)
    record_transaction(bank_transaction.transaction)
    # write out steps of method
    # need to return something to test so not testing the state - transaction hash
    # return latest transaction from transaction_history - test the method to return this not transaction_history
    # shouldn't need balance in attr_reader if all it's in there for is to test
  end

  def withdrawal(debit:)
    fail "- Withdrawal DENIED: Balance #{'%.2f' % MIN_BALANCE} -" if @balance <= 0

    @balance -= debit
    bank_transaction = @bank_transaction.new
    bank_transaction.withdrawal_transaction(debit, balance)
    record_transaction(bank_transaction.transaction)
  end

  private

  # becomes part of create_transaction
  def record_transaction(bank_transaction)
    @transaction_history << bank_transaction
  end
end
