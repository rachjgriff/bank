require 'bank_balance'

describe BankBalance do

  subject(:bank_balance) { described_class.new }

  describe '#initialize' do
    context 'When a bank account is setup' do
      it 'Balance is set to 0' do
        expect(bank_balance.balance).to eq 0
      end
    end
  end

  describe '#debosit #withdrawal' do
    context 'As a bank account holder, I can:' do
      it 'Deposit money into a bank account' do
        bank_balance.deposit(date: "10-01-2012", credit: 1000)

        expect(bank_balance.balance).to eq 1000
      end

      it 'Withdraw money from a bank account' do
        bank_balance.deposit(date: "10-01-2012", credit: 1000)
        bank_balance.withdrawal(date: "14-01-2012", debit: 500)

        expect(bank_balance.balance).to eq 500
      end
    end
  end

  describe '#deposit_transaction' do
    it 'Stores the current transaction' do
      bank_balance.deposit(date: "10-01-2012", credit: 1000)

      expect(bank_balance.transaction[:date]).to eq "10-01-2012"
      expect(bank_balance.transaction[:credit]).to eq '%.2f' % 1000
      expect(bank_balance.transaction[:debit]).to eq ""
      expect(bank_balance.transaction[:balance]).to eq '%.2f' % 1000
    end
  end

  describe '#withdrawal_transaction' do
    it 'Stores the current transaction' do
      bank_balance.deposit(date: "10-01-2012", credit: 1000)
      bank_balance.withdrawal(date: "14-01-2012", debit: 500)

      expect(bank_balance.transaction[:date]).to eq "14-01-2012"
      expect(bank_balance.transaction[:credit]).to eq ""
      expect(bank_balance.transaction[:debit]).to eq '%.2f' % 500
      expect(bank_balance.transaction[:balance]).to eq '%.2f' % 500
    end
  end
end
