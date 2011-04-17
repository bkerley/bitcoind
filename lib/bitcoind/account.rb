module Bitcoind
  class Account
    attr_accessor :name, :balance, :address
    def initialize(name, balance)
      self.name = name
      self.balance = balance
    end
  end
end
