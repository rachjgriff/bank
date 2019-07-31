class BankStatement

  def create_bank_statement(transaction_history)
    bank_statement_header
    bank_statement_transaction_list(transaction_history)
  end

  private

  def sort_transactions(transaction_history)
    transaction_history.sort_by do |transaction|
      transaction[:date]
    end.reverse
  end

  def bank_statement_transaction_list(transaction_history)
    sort_transactions(transaction_history).each do |transaction|
      puts "#{transaction[:date]} || #{transaction[:credit]} || #{transaction[:debit]} || #{transaction[:balance]}"
    end
  end

  def bank_statement_header
    puts 'date || credit || debit || balance'
  end
end
