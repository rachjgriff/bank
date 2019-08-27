# require 'bank_transaction'
#
# describe BankTransaction do
#
#   subject(:bank_transaction) { described_class.new }
#
#   before do
#     Timecop.freeze(2012, 01, 10)
#     bank_transaction.deposit_transaction(1000, 1000)
#   end
#
#   after do
#     Timecop.return
#   end
#
#   describe '#deposit_transaction' do
#     it 'Stores the current transaction' do
#       expect(bank_transaction.transaction[:date]).to eq "10/01/2012"
#       expect(bank_transaction.transaction[:credit]).to eq '%.2f' % 1000
#       expect(bank_transaction.transaction[:debit]).to eq ""
#       expect(bank_transaction.transaction[:balance]).to eq '%.2f' % 1000
#     end
#   end
#
#   describe '#withdrawal_transaction' do
#     it 'Stores the current transaction' do
#       bank_transaction.withdrawal_transaction(500, 500)
#
#       expect(bank_transaction.transaction[:date]).to eq "10/01/2012"
#       expect(bank_transaction.transaction[:credit]).to eq ""
#       expect(bank_transaction.transaction[:debit]).to eq '%.2f' % 500
#       expect(bank_transaction.transaction[:balance]).to eq '%.2f' % 500
#     end
#   end
# end
