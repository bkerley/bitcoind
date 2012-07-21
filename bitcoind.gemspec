# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "bitcoind/version"

Gem::Specification.new do |s|
  s.name        = "bitcoind"
  s.version     = Bitcoind::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Bryce Kerley"]
  s.email       = ["bkerley@brycekerley.net"]
  s.homepage    = ""
  s.summary     = %q{Control the bitcoin nework client over JSON-RPC.}
  s.description = %q{Automate your Bitcoin transactions with this Ruby interface to the bitcoind JSON-RPC API.}

  s.rubyforge_project = "bitcoind"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'rest-client', ['>= 1.6.7']
  s.add_dependency 'activesupport', ['>= 3.2.6']

  s.add_development_dependency 'guard-test', ['>= 0.1.6']
  s.add_development_dependency 'shoulda', ['>= 2.11.3']
  s.add_development_dependency 'mocha', ['>= 0.9.12']
  s.add_development_dependency 'bundler', ['>= 1.0.12']
end
