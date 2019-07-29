require 'bank_account'

describe BankAccount do

  subject(:bank_account) { described_class.new }

  context 'When a bank account is setup' do
    it 'Balance is set to 0' do
      expect(bank_account.balance).to eq 0
    end

    it 'There is no transaction history' do
      expect(bank_account.transaction_history).to eq []
    end
  end

  context 'As a bank account holder, I can:' do
    it 'Deposit money into a bank account' do
      bank_account.deposit(date: "10-01-2012", credit: 1000)

      expect(bank_account.balance).to eq 1000
    end

    it 'Withdraw money from a bank account' do
      bank_account.deposit(date: "10-01-2012", credit: 1000)
      bank_account.withdrawal(date: "14-01-2012", debit: 500)

      expect(bank_account.balance).to eq 500
    end
  end

  context 'Account holder transactions are stored' do
    it 'Current transaction' do
      bank_account.deposit(date: "10-01-2012", credit: 1000)

      expect(bank_account.transaction[:date]).to eq "10-01-2012"
      expect(bank_account.transaction[:credit]).to eq 1000
      expect(bank_account.transaction[:debit]).to eq 0
      expect(bank_account.transaction[:balance]).to eq 1000
    end

    it 'Current transaction recorded in transaction history' do
      bank_account.deposit(date: "10-01-2012", credit: 1000)
      bank_account.record_transaction

      expect(bank_account.transaction_history[0][:date]).to eq "10-01-2012"
      expect(bank_account.transaction_history[0][:credit]).to eq 1000
      expect(bank_account.transaction_history[0][:debit]).to eq 0
      expect(bank_account.transaction_history[0][:balance]).to eq 1000
    end

    it 'Multiple transactions are recorded in transaction history' do
      bank_account.deposit(date: "10-01-2012", credit: 1000)
      bank_account.record_transaction
      bank_account.deposit(date: "13-01-2012", credit: 2000)
      bank_account.record_transaction
      bank_account.withdrawal(date: "14-01-2012", debit: 500)
      bank_account.record_transaction

      expect(bank_account.transaction_history[1][:date]).to eq "13-01-2012"
      expect(bank_account.transaction_history[2][:credit]).to eq 0
      expect(bank_account.transaction_history[0][:debit]).to eq 0
      expect(bank_account.transaction_history[2][:balance]).to eq 2500
    end
  end
end
