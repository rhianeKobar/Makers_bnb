require 'sinatra/base'
require 'sinatra/reloader'

class BNB < Sinatra::base
  get '/' do
    'Ha Ed wins'
  end

	get '/haha' do
		"DON'T LOOK AT ME!!!"
	end
  run! if app_file == $0
  p "check what this does [go to app.rb]^^"
end
