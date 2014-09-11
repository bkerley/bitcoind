module BitcoindClient
  class Account

    attr_accessor :name, :balance

    def initialize(client, name)
      @client = client
      self.name = name
    end

    def inspect
      "#<BitcoindClient::Account #{self.name.inspect} >"
    end

    def send_to(bitcoinaddress, amount, minconf=1)
      txn_id = @client.request 'sendfrom', self.name, bitcoinaddress, amount, minconf.to_i
      Transaction.new @client, self, txn_id
    end

    def move_to(toaccount, amount, minconf=1)
      @client.move self.name, toaccount, amount, minconf.to_i
    end


    def balance(minconf = 1)
      @client.request 'getbalance', self.name, minconf.to_i
    end


    def address
      @client.request 'getaccountaddress', self.name
    end


    def transactions
      txn_array = @client.request 'listtransactions', self.name

      txn_array.map do |h|
        Transaction.new @client, self, h['txid']
      end
    end
  end
end
