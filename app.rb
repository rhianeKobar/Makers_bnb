require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/property.rb'

class BNB < Sinatra::Base
  get '/' do
    @properties = ["stuff1","stuff2","hcaekcj"]
    erb :index
  end

  get '/add' do
    
    erb :add
  end

  post '/add' do
    redirect '/'
  end

  run! if app_file == $0

end
