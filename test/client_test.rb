require 'helper'

class ClientTest < Test::Unit::TestCase
  context 'a Bitcoind client' do
    setup do
      @bcd = BitcoindClient.new 'testuser', 'testpass'
    end

    should 'have a simple and useful inspect' do
      assert_equal "#<BitcoindClient::Client \"http://testuser:testpass@localhost:8332\" >", @bcd.inspect
    end

    context 'balance operation' do
      setup do
        RestClient.expects(:post).
          returns("{\"result\":12.34000000,\"error\":null,\"id\":\"jsonrpc\"}\n").
          with do |e, a|
            e == 'http://testuser:testpass@localhost:8332' &&
              JSON.parse(a) == {'method'=>'getbalance', 'id'=>'jsonrpc'}
          end
      end

      should 'get the balance' do
        @result = @bcd.balance
        assert_equal 12.34, @result
      end
    end

    context 'accounts operation' do
      setup do
        RestClient.expects(:post).
          returns("{\"result\":{\"\":0.0,\"Your Address\":0.0,\"pi\":3.14,\"ben\":100.00},\"error\":null,\"id\":\"jsonrpc\"}\n").
          with do |e, a|
            e == 'http://testuser:testpass@localhost:8332' &&
              JSON.parse(a) == {'method'=>'listaccounts', 'id'=>'jsonrpc'}
          end
      end

      should 'return a hash of Account objects' do
        @result = @bcd.accounts
        assert_kind_of Hash, @result
        @result.each do |k, a|
          assert_kind_of BitcoindClient::Account, a
          assert_equal k, a.name
        end

        assert_equal 'pi', @result['pi'].name
      end
    end
  end
end
