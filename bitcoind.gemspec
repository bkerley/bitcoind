# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "bitcoind/version"

Gem::Specification.new do |s|
  s.name        = "bitcoind"
  s.version     = Bitcoind::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["TODO: Write your name"]
  s.email       = ["TODO: Write your email address"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "bitcoind"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'rest-client', ['~> 1.6.1']

  s.add_development_dependency 'guard-test', ['~> 0.1.6']
  s.add_development_dependency 'shoulda', ['~> 2.11.3']
  s.add_development_dependency 'mocha', ['~> 0.9.12']
  s.add_development_dependency 'bundler', ['~> 1.0.12']
end
