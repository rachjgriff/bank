class BankTransaction

  attr_reader :transaction, :date

  def initialize
    @transaction = {}
    @date = Time.now.strftime("%d/%m/%Y")
  end

  def deposit_transaction(credit, balance)
    @transaction[:date] = @date
    @transaction[:credit] = '%.2f' % credit
    @transaction[:debit] = ""
    @transaction[:balance] = '%.2f' % balance
  end

  def withdrawal_transaction(debit, balance)
    @transaction[:date] = @date
    @transaction[:credit] = ""
    @transaction[:debit] = '%.2f' % debit
    @transaction[:balance] = '%.2f' % balance
  end
end
