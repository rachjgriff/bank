require 'bank_balance'

describe BankBalance do

  let(:bank_transaction_class) { double :bank_transaction_class }
  let(:bank_transaction) { double :bank_transaction }

  subject(:bank_balance) { described_class.new(bank_transaction_class) }

  let(:min_balance) { BankBalance::MIN_BALANCE }

  before(:each) do
    allow(bank_transaction_class).to receive(:new) { bank_transaction }
    allow(bank_transaction).to receive(:deposit_transaction).with(1000, 1000)
    allow(bank_transaction).to receive(:transaction)
  end

  describe '#deposit #withdrawal' do

    it 'Account holder can deposit money into a bank account' do
      bank_balance.deposit(credit: 1000)

      expect(bank_balance.balance).to eq 1000
    end

    it 'Account holder can withdraw money from a bank account' do
      bank_balance.deposit(credit: 1000)

      allow(bank_transaction).to receive(:withdrawal_transaction).with(500, 500)
      bank_balance.withdrawal(debit: 500)

      expect(bank_balance.balance).to eq 500
    end

    it 'Balance is 0' do
      expect { bank_balance.withdrawal(debit: 500) }.
        to raise_error "- Withdrawal DENIED: Balance #{'%.2f' % min_balance} -"
    end
  end

  describe '#record_transaction' do

    it 'Stores a single transaction in transaction history' do
      allow(bank_transaction).to receive(:transaction) {
        { :date => "10/01/2012", :credit => "1000.00",
        :debit => "", :balance => "1000.00" }
      }

      bank_balance.deposit(credit: 1000)

      expect(bank_balance.transaction_history[0][:date]).to eq "10/01/2012"
      expect(bank_balance.transaction_history[0][:credit]).to eq '%.2f' % 1000
      expect(bank_balance.transaction_history[0][:debit]).to eq ""
      expect(bank_balance.transaction_history[0][:balance]).to eq '%.2f' % 1000
    end

    it 'Stores multiple transactions in transaction history' do
      allow(bank_transaction).to receive(:transaction) {
        { :date => "10/01/2012", :credit => "1000.00",
        :debit => "", :balance => "1000.00" }
      }

      bank_balance.deposit(credit: 1000)

      allow(bank_transaction).to receive(:deposit_transaction).with(2000, 3000)
      allow(bank_transaction).to receive(:transaction) {
        { :date => "13-01-2012", :credit => "2000.00",
        :debit => "", :balance => "3000.00" }
      }

      bank_balance.deposit(credit: 2000)

      allow(bank_transaction).to receive(:withdrawal_transaction).
        with(500, 2500)
      allow(bank_transaction).to receive(:transaction) {
        { :date => "14-01-2012", :credit => "",
        :debit => "500.00", :balance => "2500.00" }
      }

      bank_balance.withdrawal(debit: 500)

      expect(bank_balance.transaction_history[1][:date]).to eq "13-01-2012"
      expect(bank_balance.transaction_history[2][:credit]).to eq ""
      expect(bank_balance.transaction_history[0][:debit]).to eq ""
      expect(bank_balance.transaction_history[2][:balance]).to eq '%.2f' % 2500
    end
  end
end
