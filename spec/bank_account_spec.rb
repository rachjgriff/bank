require 'bank_account'

describe BankAccount do
  context 'As a bank account holder, I can:' do
    it 'Deposit money into a bank account' do
      bank_account = BankAccount.new
      bank_account.deposit(1000)
      expect(bank_account.balance).to eq 1000
    end

    it 'Withdraw money from a bank account' do
      bank_account = BankAccount.new
      bank_account.deposit(1000)
      bank_account.withdraw(500)
      expect(bank_account.balance).to eq 500
    end
  end
end
