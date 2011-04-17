require 'helper'

class BalanceTest < Test::Unit::TestCase
  context 'balance operation' do
    setup do
      RestClient.expects(:post).
        with('http://testuser:testpass@localhost:8332',{'method'=>'getbalance', 'id'=>'jsonrpc'}.to_json).
        returns("{\"result\":12.34000000,\"error\":null,\"id\":\"jsonrpc\"}\n")
      @bcd = Bitcoind.new 'testuser', 'testpass'
    end

    should 'get the balance' do
      @result = @bcd.balance
      assert_equal 12.34, @result
    end
  end
end
