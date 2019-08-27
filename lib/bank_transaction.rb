class BankTransaction

  attr_reader :transaction

  def initialize(credit, debit, balance)
    @transaction = {}
    @date = Time.now.strftime("%d/%m/%Y")
    @credit = credit
    @debit = debit
    @balance = balance
  end

  def transaction_entry
    @transaction[:date] = @date
    @transaction[:credit] = '%.2f' % @credit
    @transaction[:debit] = '%.2f' % @debit
    @transaction[:balance] = '%.2f' % @balance
    @transaction
  end
end
