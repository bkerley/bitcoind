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
      AccountHash.new self, balance_hash
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
