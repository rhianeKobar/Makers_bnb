require 'sinatra/base'
require 'sinatra/reloader'

class BNB < Sinatra::base
  get '/' do
    'Ha Ed wins'
  end

  run! if app_file == $0
  p "check what this does [go to app.rb]^^"


  route '/eds-route' do
    "hello it is ed"
  end




end
