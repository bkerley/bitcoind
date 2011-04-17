module Bitcoind
  class Account
    extend ActiveSupport::Memoizable
    attr_accessor :name, :balance

    def initialize(client, name)
      @client = client
      self.name = name
    end

    def inspect
      "#<Bitcoind::Account #{self.name.inspect} >"
    end

    def balance
      @client.request 'getbalance', self.name
    end
    memoize :balance

    def address
      @client.request 'getaccountaddress', self.name
    end
    memoize :address
  end
end
