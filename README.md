sinatra-base
====

After spending 30 minutes trying to figure out how to do this properly, here is my bare-bones sinatra app that works with rack based servers and allows for easy local development.

- - -

config.ru: rackup file for rack based servers (passenger/thin etc.), you shouldn't put anything in here

	rackup config.ru

boot.rb: initialization file, handle configuration here. local dev via sinatra builtin webrick

	ruby boot.rb
	
application.rb: your routes/application, go nuts.