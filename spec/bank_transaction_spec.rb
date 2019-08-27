require 'bank_transaction'

describe BankTransaction do

  before do
    Timecop.freeze(2012, 01, 10)
  end

  after do
    Timecop.return
  end

  describe '#transaction_entry' do
    it 'Returns the current transaction entry' do
      bank_transaction = BankTransaction.new(1000, 0, 1000)
      expect(bank_transaction.transaction_entry).to include(
        :date => "10/01/2012",
        :credit => "1000.00",
        :debit => "0.00",
        :balance => "1000.00"
      )
    end
  end
end
