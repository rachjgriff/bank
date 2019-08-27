require 'bank_account'

describe 'Bank Account Holder Interactions' do
  context 'When a bank account holder makes transactions' do
    it 'Returns a printed statement of transactions in reverse chronological order' do
      bank_account = BankAccount.new

      Timecop.freeze(2012, 01, 10)
      bank_account.bank_balance.deposit(1000)

      Timecop.freeze(2012, 01, 13)
      bank_account.bank_balance.deposit(2000)

      Timecop.freeze(2012, 01, 14)
      bank_account.bank_balance.withdrawal(500)

      Timecop.return

      expect { bank_account.print_bank_statement }.to output(
        "date || credit || debit || balance\n" +
        "14/01/2012 ||  || 500.00 || 2500.00\n" +
        "13/01/2012 || 2000.00 ||  || 3000.00\n" +
        "10/01/2012 || 1000.00 ||  || 1000.00\n"
      ).to_stdout
    end
  end
end

# slice up into more than one feature
# what are the big chuncks of the program - deposit/withdraw, transaction, statement
# the above is not a feature test, rather an end to end test to make sure everything runs together
