# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "listen"
  s.version = "0.4.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.authors = ["Thibaud Guillaume-Gentil", "Maher Sallam"]
  s.date = "2012-06-27"
  s.description = "The Listen gem listens to file modifications and notifies you about the changes. Works everywhere!"
  s.email = ["thibaud@thibaud.me", "maher@sallam.me"]
  s.homepage = "https://github.com/guard/listen"
  s.require_paths = ["lib"]
  s.rubyforge_project = "listen"
  s.rubygems_version = "1.8.24"
  s.summary = "Listen to file modifications"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rb-fsevent>, ["~> 0.9.1"])
      s.add_runtime_dependency(%q<rb-inotify>, ["~> 0.8.8"])
      s.add_runtime_dependency(%q<rb-fchange>, ["~> 0.0.5"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
    else
      s.add_dependency(%q<rb-fsevent>, ["~> 0.9.1"])
      s.add_dependency(%q<rb-inotify>, ["~> 0.8.8"])
      s.add_dependency(%q<rb-fchange>, ["~> 0.0.5"])
      s.add_dependency(%q<bundler>, [">= 0"])
    end
  else
    s.add_dependency(%q<rb-fsevent>, ["~> 0.9.1"])
    s.add_dependency(%q<rb-inotify>, ["~> 0.8.8"])
    s.add_dependency(%q<rb-fchange>, ["~> 0.0.5"])
    s.add_dependency(%q<bundler>, [">= 0"])
  end
end
