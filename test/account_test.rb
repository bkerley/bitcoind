require 'helper'

class AccountTest < Test::Unit::TestCase
  context 'an Account' do
    setup do
      @client = stub
      @acc = Bitcoind::Account.new @client, 'pi'
    end

    should 'have name' do
      assert_equal 'pi', @acc.name
    end

    should 'ask the client for a balance' do
      @client.expects(:request).
        once.
        with('getbalance', 'pi').
        returns(3.14)

      @balance = @acc.balance

      assert_equal 3.14, @balance
    end

    should 'ask the client for an address' do
      @client.expects(:request).
        once.
        with('getaccountaddress', 'pi').
        returns('testaddress')

      @address = @acc.address

      assert_equal 'testaddress', @address
    end
  end
end
