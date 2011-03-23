require 'rubygems'
require 'bundler'
Bundler.require(:default, :development)
$:.unshift(::File.expand_path('../lib',  __FILE__))

require 'log'
configure :development do |config|
  require 'sinatra/reloader'
  config.also_reload 'lib/**/*.rb'
  
  $log = Log.new(STDOUT)
  $log.level = Log::DEBUG
  
  enable :logging, :dump_errors, :raise_errors
end

configure :production do
  
  logfile = ::File.join(::File.expand_path('../log',  __FILE__), 'production.log')
  $log = Log.new(logfile)
  $log.level = Log::ERROR
  
  enable :logging, :dump_errors
  
  STDOUT.reopen(logfile)
  STDERR.reopen(logfile)
end

require ::File.expand_path('../application',  __FILE__)