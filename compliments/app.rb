require 'bundler' #require bundler
Bundler.require #require everything in bundler in gemfile
require './lib/compliment.rb'

class Compliments < Sinatra::Application

	get '/compliments' do
		new_compliment = Compliment.new.
		@my_message = new_compliment.message
		@my_image = new_compliment.image
		erb :compliment
	end

end