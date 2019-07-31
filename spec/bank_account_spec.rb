require 'bank_account'

describe BankAccount do

  let(:bank_statement) { double :bank_statement }
  subject(:bank_account) { described_class.new(bank_statement) }

  describe '#initialize'
    context 'When a bank account is setup' do
      it 'Balance is set to 0' do
        expect(bank_account.balance).to eq 0
      end

      it 'There is no transaction history' do
        expect(bank_account.transaction_history).to eq []
      end
    end
  end

  describe '#debosit #withdrawal'
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
  end

    context 'Account holder transactions are stored' do
      it 'As a current transaction' do
        bank_account.deposit(date: "10-01-2012", credit: 1000)

        expect(bank_account.transaction[:date]).to eq "10-01-2012"
        expect(bank_account.transaction[:credit]).to eq '%.2f' % 1000
        expect(bank_account.transaction[:debit]).to eq ""
        expect(bank_account.transaction[:balance]).to eq '%.2f' % 1000
      end

      it 'In transaction history' do
        bank_account.deposit(date: "10-01-2012", credit: 1000)
        bank_account.record_transaction

        expect(bank_account.transaction_history[0][:date]).to eq "10-01-2012"
        expect(bank_account.transaction_history[0][:credit]).to eq '%.2f' % 1000
        expect(bank_account.transaction_history[0][:debit]).to eq ""
        expect(bank_account.transaction_history[0][:balance]).to eq '%.2f' % 1000.00
      end

      it 'Multiple transactions are stored in transaction history' do
        bank_account.deposit(date: "10-01-2012", credit: 1000)
        bank_account.record_transaction
        bank_account.deposit(date: "13-01-2012", credit: 2000)
        bank_account.record_transaction
        bank_account.withdrawal(date: "14-01-2012", debit: 500)
        bank_account.record_transaction

        expect(bank_account.transaction_history[1][:date]).to eq "13-01-2012"
        expect(bank_account.transaction_history[2][:credit]).to eq ""
        expect(bank_account.transaction_history[0][:debit]).to eq ""
        expect(bank_account.transaction_history[2][:balance]).to eq '%.2f' % 2500
      end
    end

    context 'Bank statement' do
      it 'Account holder can print bank statement' do
        allow(bank_statement).to receive(:create_bank_statement) { "formatted bank statement" }
        # add in .with(transaction_history)
        expect(bank_account.print_bank_statement).to eq "formatted bank statement"
      end
    end
end
