module Bitcoind
  class Transaction
    extend ActiveSupport::Memoizable
    attr_accessor :id, :account
    def initialize(client, account, id)
      @client = client
      self.account = account
      self.id = id
    end

    def detail_hash
      @client.request 'gettransaction', self.id
    end
    memoize :detail_hash

    def amount
      detail_hash['amount']
    end
  end
end
