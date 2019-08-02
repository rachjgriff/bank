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

    bank_transaction = @bank_transaction.new
    bank_transaction.deposit_transaction(credit, balance)
    record_transaction(bank_transaction.transaction)
  end

  def withdrawal(debit:)
    fail "- Withdrawal DENIED: Balance #{'%.2f' % MIN_BALANCE} -" if @balance <= 0

    @balance -= debit
    bank_transaction = @bank_transaction.new
    bank_transaction.withdrawal_transaction(debit, balance)
    record_transaction(bank_transaction.transaction)
  end

  private

  def record_transaction(bank_transaction)
    @transaction_history << bank_transaction
  end
end
