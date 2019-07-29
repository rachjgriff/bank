require 'bank_account'

describe BankAccount do
  context 'When a bank account is setup' do
    it 'Balance is set to 0' do
      bank_account = BankAccount.new
      expect(bank_account.balance).to eq 0
    end

    it 'There is no transaction history' do
      bank_account = BankAccount.new
      expect(bank_account.transactions).to eq []
    end
  end
  # context 'As a bank account holder, I can:' do
    # it 'Deposit money into a bank account' do
    #   bank_account = BankAccount.new
    #   bank_account.deposit(1000)
    #   expect(bank_account.balance).to eq 1000
    # end
    #
    # it 'Withdraw money from a bank account' do
    #   bank_account = BankAccount.new
    #   bank_account.deposit(1000)
    #   bank_account.withdraw(500)
    #   expect(bank_account.balance).to eq 500
    # end
  # end
end
