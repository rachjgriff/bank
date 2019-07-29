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
    @transaction[:credit] = credit
    @transaction[:debit] = ""
    @transaction[:balance] = @balance
  end

  def withdrawal(date:, debit:)
    @balance -= debit

    @transaction = {}
    @transaction[:date] = date
    @transaction[:credit] = ""
    @transaction[:debit] = debit
    @transaction[:balance] = @balance
  end

  def record_transaction
    @transaction_history << @transaction
  end

  def bank_statement
    puts 'date || credit || debit || balance'

    @transaction_history.each do |transaction|
      puts "#{transaction[:date]} || #{transaction[:credit]} || #{transaction[:debit]} || #{transaction[:balance]}"
    end
  end
end
