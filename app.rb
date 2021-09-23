require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/property.rb'

class BNB < Sinatra::Base
  get '/' do
    @properties = Property.all
    erb :index
  end

  get '/add' do
    erb :add
  end

  post '/add' do
    p params
    Property.add(name: params['name'], description: params['description'], price: params['price'], availability: Property.to_boolean(params['available']))
    redirect '/'
  end


  run! if app_file == $0

end