class BankTransaction

  attr_reader :transaction, :date

  def initialize(credit, debit, balance)
    # @transaction = {}
    @date = Time.now.strftime("%d/%m/%Y")
    @transaction[:credit] = '%.2f' % credit
    @transaction[:debit] = '%.2f' % debit
    @transaction[:balance] = '%.2f' % balance
  end

  # def deposit_transaction(credit, balance)
  #   @transaction[:date] = @date
  #   @transaction[:credit] = '%.2f' % credit
  #   @transaction[:debit] = ""
  #   @transaction[:balance] = '%.2f' % balance
  # end
  #
  # def withdrawal_transaction(debit, balance)
  #   @transaction[:date] = @date
  #   @transaction[:credit] = ""
  #   @transaction[:debit] = '%.2f' % debit
  #   @transaction[:balance] = '%.2f' % balance
  # end
end

# create one method - user_transaction
# setup class to be initialized with this info
# BankBalance should hold the logic to determine credit or debit
# if implemented, wouldn't need to test this class
