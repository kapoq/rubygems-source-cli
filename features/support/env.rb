ENV["RUBY_ENV"] ||= "test"

require 'rubygems'
require 'bundler'
Bundler.setup
require 'rubygems-source-cli'
require 'aruba/cucumber'


