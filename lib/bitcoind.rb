require 'json'
require 'rest_client'

%w{ client account }.each do |f|
  require File.join(File.dirname(__FILE__), 'bitcoind', f)
end

module Bitcoind
  def self.new(user, pass)
    return Client.new user, pass
  end
end
