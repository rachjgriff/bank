require 'bank_account'

describe BankAccount do

  let(:bank_statement) { double :bank_statement }
  let(:bank_balance) { double :bank_balance }

  subject(:bank_account) { described_class.new(bank_statement, bank_balance) }

  describe '#print_bank_statement' do
    context 'When a bank account holder requests a printed bank statement' do
      it 'Returns a formatted bank statement containing the transaction history' do
        allow(bank_balance).to receive(:transaction_history)
        allow(bank_statement).
          to receive(:create_bank_statement) { "formatted bank statement" }

        expect(bank_account.print_bank_statement).to eq "formatted bank statement"
      end
    end
  end
end
