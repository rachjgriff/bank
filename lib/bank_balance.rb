class BankBalance

  MIN_BALANCE = 0
  attr_reader :balance, :transaction

  def initialize
    @balance = 0
    @date = Time.now.strftime("%d/%m/%Y")
  end

  def deposit(credit:)
    @balance += credit
    deposit_transaction(credit)
  end

  def withdrawal(debit:)
    fail "-- Withdrawal DENIED: Balance #{'%.2f' % MIN_BALANCE} --" if @balance <= 0

    @balance -= debit
    withdrawal_transaction(debit)
  end

  private

  def deposit_transaction(credit)
    @transaction = {}
    @transaction[:date] = @date
    @transaction[:credit] = '%.2f' % credit
    @transaction[:debit] = ""
    @transaction[:balance] = '%.2f' % @balance
  end

  def withdrawal_transaction(debit)
    @transaction = {}
    @transaction[:date] = @date
    @transaction[:credit] = ""
    @transaction[:debit] = '%.2f' % debit
    @transaction[:balance] = '%.2f' % @balance
  end
end
