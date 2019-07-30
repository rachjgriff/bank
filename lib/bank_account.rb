class BankAccount

  attr_reader :balance, :transaction, :transaction_history

  def initialize
    @balance = 0
    @transaction_history = []
  end

  def deposit(date:, credit:)
    @balance += credit

    @transaction = {}
    @transaction[:date] = date
    @transaction[:credit] = '%.2f' % credit
    @transaction[:debit] = ""
    @transaction[:balance] = '%.2f' % @balance
  end

  def withdrawal(date:, debit:)
    @balance -= debit

    @transaction = {}
    @transaction[:date] = date
    @transaction[:credit] = ""
    @transaction[:debit] = '%.2f' % debit
    @transaction[:balance] = '%.2f' % @balance
  end

  def record_transaction
    @transaction_history << @transaction
  end

  def bank_statement
    bank_statement_header
    bank_statement_transaction_list
  end

  private

  def sort_transactions
    @transaction_history.sort_by do |transaction|
      transaction[:date]
    end.reverse
  end

  def bank_statement_transaction_list
    sort_transactions.each do |transaction|
      puts "#{transaction[:date]} || #{transaction[:credit]} || #{transaction[:debit]} || #{transaction[:balance]}"
    end
  end

  def bank_statement_header
    puts 'date || credit || debit || balance'
  end
end
