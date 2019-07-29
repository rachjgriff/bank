require 'bank_account'

describe BankAccount do
  context 'When a bank account is setup' do
    it 'Balance is set to 0' do
      bank_account = BankAccount.new
      expect(bank_account.balance).to eq 0
    end

    it 'There is no existing transaction' do
      bank_account = BankAccount.new
      expect(bank_account.transaction[:date]).to eq ""
      expect(bank_account.transaction[:credit]).to eq 0
      expect(bank_account.transaction[:debit]).to eq 0
      expect(bank_account.transaction[:balance]).to eq 0
    end

    it 'There is no transaction history' do
      bank_account = BankAccount.new
      expect(bank_account.transaction_history).to eq []
    end
  end

  context 'As a bank account holder, I can:' do
    it 'Deposit money into a bank account' do
      bank_account = BankAccount.new
      bank_account.deposit(date: "10-01-2012", credit: 1000)
      expect(bank_account.balance).to eq 1000
    end

    it 'Withdraw money from a bank account' do
      bank_account = BankAccount.new
      bank_account.deposit(date: "10-01-2012", credit: 1000)
      bank_account.withdrawal(date: "10-01-2012", debit: 500)
      expect(bank_account.balance).to eq 500
    end

    it 'Track my current transaction' do
      bank_account = BankAccount.new
      bank_account.deposit(date: "10-01-2012", credit: 1000)
      expect(bank_account.transaction[:date]).to eq "10-01-2012"
      expect(bank_account.transaction[:credit]).to eq 1000
      expect(bank_account.transaction[:debit]).to eq 0
      expect(bank_account.transaction[:balance]).to eq 1000
    end
  end
end
