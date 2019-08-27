require_relative 'bank_transaction'

class BankBalance

  MIN_BALANCE = 0

  attr_reader :transaction_history

  def initialize(bank_transaction = BankTransaction)
    @balance = 0
    @transaction_history = []
    @bank_transaction = bank_transaction
  end

  def deposit(credit)
    @balance += credit

    create_transaction(credit, 0, @balance)
    transaction_history.last
  end

  def withdrawal(debit)
    fail "- Withdrawal DENIED: Balance #{'%.2f' % MIN_BALANCE} -" if @balance - debit <= 0

    @balance -= debit
    create_transaction(0, debit, @balance)
    transaction_history.last
  end

  private

  def create_transaction(credit, debit, balance)
    new_bank_transaction = @bank_transaction.new(credit, debit, balance)
    new_bank_transaction.transaction_entry
    record_transaction(new_bank_transaction.transaction)
  end

  def record_transaction(new_bank_transaction)
    @transaction_history << new_bank_transaction
  end
end
