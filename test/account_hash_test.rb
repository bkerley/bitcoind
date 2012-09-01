require 'helper'

class AccountHashTest < Test::Unit::TestCase
  context 'an AccountHash' do
    setup do
      @client = stub
      @ach = BitcoindClient::AccountHash.new @client, ""=>0.0, "pi"=>3.14, "benjamin"=>100.0
    end

    should 'access accounts like a normal hash' do
      assert_equal 'pi', @ach['pi'].name
      assert_equal 'benjamin', @ach['benjamin'].name
    end

    context 'new method' do
      should 'make a new account with a given name' do
        @client.expects(:request).
          once.
          with('getnewaddress', 'new test account').
          returns('xxxnewtestaddress')

        @act = @ach.new_account 'new test account'
        assert_equal 'new test account', @act.name
      end
    end
  end
end
