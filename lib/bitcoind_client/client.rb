module BitcoindClient
  class Client
    def initialize(user, pass, host, port)
      @endpoint = "http://#{user}:#{pass}@#{host}:#{port}"
    end

    def balance
      request 'getbalance'
    end

    def balance_from_account(fromaccount, minconf = 6)
      request 'getbalance', fromaccount, minconf.to_i
    end

    def move(fromaccount, toaccount, amount, minconf=1)

      request 'move', fromaccount, toaccount, amount, minconf.to_i
    end

    def accounts
      balance_hash = request 'listaccounts'
      AccountHash.new self, balance_hash
    end

    def request(method, *args)

      begin

        body = { 'id'=>'jsonrpc', 'method'=>method}
        body['params'] = args unless args.empty?
        puts body.to_s
        response_json = RestClient.post @endpoint, body.to_json
        puts response_json.to_s
        response = JSON.parse response_json
        return response['result']

      rescue Exception => msg

        puts msg.to_s
      end

    end

    def inspect
      "#<BitcoindClient::Client #{@endpoint.inspect} >"
    end
  end
end
