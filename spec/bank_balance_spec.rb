require 'bank_balance'

describe BankBalance do

  let(:bank_transaction_class) { double :bank_transaction_class }
  let(:new_bank_transaction) { double :new_bank_transaction }

  subject(:bank_balance) { described_class.new(bank_transaction_class) }

  let(:min_balance) { BankBalance::MIN_BALANCE }

  before(:each) do
    allow(bank_transaction_class).to receive(:new) { new_bank_transaction }
    allow(new_bank_transaction).to receive(:transaction_entry)
  end

  describe '#deposit' do
    context 'When a bank account holder deposits money into their bank account' do
      it 'Returns the transaction' do
        allow(new_bank_transaction).to receive(:transaction) {
          { :date => "10/01/2012",
            :credit => "1000.00",
            :debit => "0.00",
            :balance => "1000.00"
          }
        }

        expect(bank_balance.deposit(1000)).to include(
          :date => "10/01/2012",
          :credit => "1000.00",
          :debit => "0.00",
          :balance => "1000.00"
        )
      end
    end
  end

  describe '#withdrawal' do
    context 'When a bank account holder withdraws money from their bank account' do
      it 'Returns the transaction' do
        allow(new_bank_transaction).to receive(:transaction) {
          { :date => "10/01/2012",
            :credit => "1000.00",
            :debit => "0.00",
            :balance => "1000.00"
          }
        }

        bank_balance.deposit(1000)

        allow(new_bank_transaction).to receive(:transaction) {
          { :date => "11/01/2012",
            :credit => "0.00",
            :debit => "500.00",
            :balance => "500.00"
          }
        }
        expect(bank_balance.withdrawal(500)).to include(
          :date => "11/01/2012",
          :credit => "0.00",
          :debit => "500.00",
          :balance => "500.00"
        )
      end
    end

    context 'When the bank account balance minus the withdrawal amount is zero or less' do
      it 'Returns an error message' do
        expect { bank_balance.withdrawal(500) }.
          to raise_error "- Withdrawal DENIED: Balance #{'%.2f' % min_balance} -"
      end
    end
  end
end
