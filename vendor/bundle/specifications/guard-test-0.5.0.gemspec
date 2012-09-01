# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "guard-test"
  s.version = "0.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.authors = ["R\u{e9}my Coutable"]
  s.date = "2012-06-02"
  s.description = "Guard::Test automatically run your tests on file modification."
  s.email = ["remy@rymai.me"]
  s.homepage = "https://github.com/guard/guard-test"
  s.require_paths = ["lib"]
  s.rubyforge_project = "guard-test"
  s.rubygems_version = "1.8.24"
  s.summary = "Guard gem for test-unit 2"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<guard>, [">= 1.1.0"])
      s.add_runtime_dependency(%q<test-unit>, ["~> 2.2"])
      s.add_development_dependency(%q<bundler>, ["~> 1.1"])
      s.add_development_dependency(%q<rspec>, ["~> 2.10"])
    else
      s.add_dependency(%q<guard>, [">= 1.1.0"])
      s.add_dependency(%q<test-unit>, ["~> 2.2"])
      s.add_dependency(%q<bundler>, ["~> 1.1"])
      s.add_dependency(%q<rspec>, ["~> 2.10"])
    end
  else
    s.add_dependency(%q<guard>, [">= 1.1.0"])
    s.add_dependency(%q<test-unit>, ["~> 2.2"])
    s.add_dependency(%q<bundler>, ["~> 1.1"])
    s.add_dependency(%q<rspec>, ["~> 2.10"])
  end
end
