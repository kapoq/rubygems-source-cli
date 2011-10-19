# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rubygems-source-cli/version"

Gem::Specification.new do |s|
  s.name        = "rubygems-source-cli"
  s.version     = Rubygems::Source::CLI::VERSION
  s.authors     = ["dave@kapoq.com"]
  s.email       = ["dave@kapoq.com"]
  s.homepage    = ""
  s.summary     = "Patches for gem serve, gem push, gem yank, and some utilities"
  s.description = "Patches for gem serve, gem push, gem yank, and some utilities"

  s.add_development_dependency "cucumber"
  s.add_development_dependency "aruba"
  s.add_development_dependency "rspec"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "rake"
  s.add_development_dependency "capybara"
  s.add_development_dependency "builder"
  s.add_development_dependency "gemcutter"
  if RUBY_PLATFORM =~ /linux/
    s.add_development_dependency "rb-inotify"
    s.add_development_dependency "libnotify"
  end
  
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
