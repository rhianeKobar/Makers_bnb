require 'sinatra/base'
require 'sinatra/reloader'

class BNB < Sinatra::base
  get '/' do
    'Hello world!'
  end

  run! if app_file == $0
  p "check what this does [go to app.rb]^^"
end
