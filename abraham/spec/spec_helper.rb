require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

Dir['./lib/*.rb'].each { |path| require path }
# Dir['./spec/support/*.rb'].each { |path| require path }
