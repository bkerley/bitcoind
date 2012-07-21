require 'json'
require 'rest_client'
require 'active_support/memoizable'

%w{ client account account_hash transaction }.each do |f|
  require File.join(File.dirname(__FILE__), 'bitcoind_client', f)
end

module BitcoindClient
  def self.new(user, pass)
    return Client.new user, pass
  end
end
