# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'test' do
  watch(%r{lib/bitcoind_client/(.*)\.rb})      { |m| "test/#{m[1]}_test.rb" }
  watch(%r{test/.*_test\.rb})
  watch('lib/bitcoind_client.rb') { 'test' }
  watch('test/test_helper.rb') { "test" }
end
