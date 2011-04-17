require 'helper'

class TransactionTest < Test::Unit::TestCase
  context 'a transaction' do
    setup do
      @client = stub
      @acc = Bitcoind::Account.new @client, 'pi'
      @txn = Bitcoind::Transaction.new @client, @acc, 'testtxnid'
    end

    should 'have an amount' do
      @client.expects(:request).
        once.
        with('gettransaction', 'testtxnid').
        returns('amount'=>3.14, 'confirmations'=>420, 'txid'=>'testtxnid',
                'time'=>1234567890, 'details'=>{
                  'account'=> 'pi',
                  'address'=>'testaddress',
                  'category'=>'receive',
                  'amount'=>3.14
                })

      assert_equal 3.14, @txn.amount
    end
  end
end
