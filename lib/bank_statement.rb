class BankStatement

  def create_bank_statement(transaction_history)
    bank_statement_print_view(transaction_history)
  end

  private

  def remove_zero_transaction_values(transaction_history)
    transaction_history.map do |transaction|
      if transaction[:credit] == "0.00"
        transaction[:credit] = ""
      elsif transaction[:debit] == "0.00"
        transaction[:debit] = ""
      end    
    end
  end

  def sort_transactions(transaction_history)
    transaction_history.sort_by do |transaction|
      transaction[:date]
    end.reverse
  end

  def bank_statement_print_view(transaction_history)
    remove_zero_transaction_values(transaction_history)

    print_view = sort_transactions(transaction_history).map do |transaction|
      "#{transaction[:date]} || #{transaction[:credit]} || #{transaction[:debit]} || #{transaction[:balance]}\n"
    end

    puts "#{bank_statement_header}#{print_view.join}"
  end

  def bank_statement_header
    "date || credit || debit || balance\n"
  end
end
