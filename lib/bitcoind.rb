require 'json'
require 'rest_client'
require 'active_support/memoizable'

%w{ client account account_hash transaction }.each do |f|
  require File.join(File.dirname(__FILE__), 'bitcoind', f)
end

module Bitcoind
  def self.new(user, pass)
    return Client.new user, pass
  end
end
