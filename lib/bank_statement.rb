class BankStatement

  def create_bank_statement(transaction_history)
    bank_statement_print_view(transaction_history)
  end

  private

  def sort_transactions(transaction_history)
    transaction_history.sort_by do |transaction|
      transaction[:date]
    end.reverse
  end

  def bank_statement_print_view(transaction_history)
    print_view = sort_transactions(transaction_history).map do |transaction|
      "#{transaction[:date]} || #{transaction[:credit]} || #{transaction[:debit]} || #{transaction[:balance]}\n"
    end
    puts "date || credit || debit || balance\n#{print_view.join}"
  end
end
