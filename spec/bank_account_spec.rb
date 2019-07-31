require 'bank_account'

describe BankAccount do

  let(:bank_statement) { double :bank_statement }
  let(:bank_balance) { double :bank_balance }
  subject(:bank_account) { described_class.new(bank_statement, bank_balance) }

  describe '#initialize' do
    context 'When a bank account is setup' do
      it 'There is no transaction history' do
        expect(bank_account.transaction_history).to eq []
      end
    end
  end

  describe '#record_transaction' do

    it 'Stores a single transaction in transaction history' do
      allow(bank_balance).to receive(:transaction) { { :date => "10-01-2012", :credit => "1000.00", :debit => "", :balance => "1000.00" } }
      bank_account.record_transaction

      expect(bank_account.transaction_history[0][:date]).to eq "10-01-2012"
      expect(bank_account.transaction_history[0][:credit]).to eq '%.2f' % 1000
      expect(bank_account.transaction_history[0][:debit]).to eq ""
      expect(bank_account.transaction_history[0][:balance]).to eq '%.2f' % 1000.00
    end

    it 'Stores multiple transactions in transaction history' do
      allow(bank_balance).to receive(:transaction) { { :date => "10-01-2012", :credit => "1000.00", :debit => "", :balance => "1000.00" } }
      bank_account.record_transaction

      allow(bank_balance).to receive(:transaction) { { :date => "13-01-2012", :credit => "2000.00", :debit => "", :balance => "3000.00" } }
      bank_account.record_transaction

      allow(bank_balance).to receive(:transaction) { { :date => "14-01-2012", :credit => "", :debit => "500.00", :balance => "2500.00" } }
      bank_account.record_transaction

      expect(bank_account.transaction_history[1][:date]).to eq "13-01-2012"
      expect(bank_account.transaction_history[2][:credit]).to eq ""
      expect(bank_account.transaction_history[0][:debit]).to eq ""
      expect(bank_account.transaction_history[2][:balance]).to eq '%.2f' % 2500
    end
  end

  describe '#print_bank_statement' do
    it 'Account holder can print bank statement' do
      allow(bank_statement).to receive(:create_bank_statement) { "formatted bank statement" }

      expect(bank_account.print_bank_statement).to eq "formatted bank statement"
    end
  end
end
