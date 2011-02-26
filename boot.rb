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
end

configure :production do
  $log = Log.new(::File.join(::File.expand_path('../log',  __FILE__), 'application.log'))
  $log.level = Log::ERROR
end

$log.info "TEST!"

require ::File.expand_path('../application',  __FILE__)