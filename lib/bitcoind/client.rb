module Bitcoind
  class Client
    def initialize(user, pass)
      @endpoint = "http://#{user}:#{pass}@localhost:8332"
    end

    def balance
      request 'getbalance'
    end

    def accounts
      balance_hash = request 'listaccounts'
      account_hash = { }
      balance_hash.each do |n, b|
        account_hash[n] = Account.new n, b
      end
      account_hash
    end

    def request(method, *args)
      body = { 'id'=>'jsonrpc', 'method'=>method}
      body['params'] = args unless args.empty?
      response_json = RestClient.post @endpoint, body.to_json
      response = JSON.parse response_json
      return response['result']
    end
  end
end
