require 'bank_balance'

describe BankBalance do

  subject(:bank_balance) { described_class.new }

  let(:min_balance) { BankBalance::MIN_BALANCE }

  before do
    date = Timecop.freeze(2012, 01, 10)
  end

  after do
    Timecop.return
  end

  describe '#initialize' do
    context 'When a bank account is setup' do
      it 'Balance is set to 0' do
        expect(bank_balance.balance).to eq 0
      end
    end
  end

  describe '#deposit' do
    it 'Account holder can deposit money into a bank account' do
      bank_balance.deposit(credit: 1000)

      expect(bank_balance.balance).to eq 1000
    end
  end

  describe '#withdrawal' do
    it 'Account holder can withdraw money from a bank account' do
      bank_balance.deposit(credit: 1000)
      bank_balance.withdrawal(debit: 500)

      expect(bank_balance.balance).to eq 500
    end

    it 'Account holder cannot withdraw money if balance is 0' do
      expect { bank_balance.withdrawal(debit: 500) }.to raise_error "-- Withdrawal DENIED: Balance #{'%.2f' % min_balance} --"
    end
  end

  describe '#deposit_transaction' do
    it 'Stores the current transaction' do
      bank_balance.deposit(credit: 1000)

      expect(bank_balance.transaction[:date]).to eq "10/01/2012"
      expect(bank_balance.transaction[:credit]).to eq '%.2f' % 1000
      expect(bank_balance.transaction[:debit]).to eq ""
      expect(bank_balance.transaction[:balance]).to eq '%.2f' % 1000
    end
  end

  describe '#withdrawal_transaction' do
    it 'Stores the current transaction' do
      bank_balance.deposit(credit: 1000)
      bank_balance.withdrawal(debit: 500)

      expect(bank_balance.transaction[:date]).to eq "10/01/2012"
      expect(bank_balance.transaction[:credit]).to eq ""
      expect(bank_balance.transaction[:debit]).to eq '%.2f' % 500
      expect(bank_balance.transaction[:balance]).to eq '%.2f' % 500
    end
  end
end
