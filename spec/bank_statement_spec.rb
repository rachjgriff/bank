require 'bank_statement'

describe BankStatement do

  let(:transaction_history) { [
    { :date => "10/01/2012", :credit => "1000.00",
        :debit => "", :balance => "1000.00" },
    { :date => "13/01/2012", :credit => "2000.00",
        :debit => "", :balance => "3000.00" },
    { :date => "14/01/2012", :credit => "",
        :debit => "500.00", :balance => "2500.00" }
    ]
  }

  context 'Account holder can see transaction history' do
    it 'Print statement in reverse chronological order' do

      bank_statement = BankStatement.new
      expect { bank_statement.create_bank_statement(transaction_history) }.to output("date || credit || debit || balance\n14/01/2012 ||  || 500.00 || 2500.00\n13/01/2012 || 2000.00 ||  || 3000.00\n10/01/2012 || 1000.00 ||  || 1000.00\n").to_stdout
    end
  end
end

# .join(\n)
