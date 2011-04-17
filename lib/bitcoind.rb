require 'json'
%w{ client }.each do |f|
  require File.join(File.dirname(__FILE__), 'bitcoind', f)
end
module Bitcoind
  # Your code goes here...
end
