module BitcoindClient
  class AccountHash < Hash
    def initialize(client, balance_hash)
      @client = client
      balance_hash.each do |name,b|
        self[name] = Account.new client, name
      end
    end

    def new(name)
      addr = @client.request 'getnewaddress', name

      self[name] = Account.new @client, name

      self[name]
    end
  end
end
