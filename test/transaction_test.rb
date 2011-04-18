require 'helper'

class TransactionTest < Test::Unit::TestCase
  context 'a transaction' do
    setup do
      @client = stub
      @acc = Bitcoind::Account.new @client, 'pi'
      @txn = Bitcoind::Transaction.new @client, @acc, 'testtxnid'
    end

    context 'with a detail_hash' do
      setup do
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
      end
      should 'have an amount, confirmations, time' do
        assert_equal 3.14, @txn.amount
        assert_equal 420, @txn.confirmations
        assert_equal Time.at(1234567890), @txn.time
      end
    end

    context 'without a detail_hash' do
      setup do
        @client.expects(:request).
          once.
          with('gettransaction', 'testtxnid').
          raises(RestClient::InternalServerError)
      end

      should 'have a sane inspect' do
        assert_equal "#<Bitcoind::Transaction testtxnid UNCONFIRMED>", @txn.inspect
      end

      should 'have zero confirmations and be unconfirmed' do
        assert_equal 0, @txn.confirmations
        assert !@txn.confirmed?
      end
    end
  end
end
