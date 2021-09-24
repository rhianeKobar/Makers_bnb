require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/property.rb'
require_relative './db/queries/pg_connect.rb'
require_relative './lib/user'

class BNB < Sinatra::Base
  
  DB.connect

  get '/' do
    @properties = Property.all
    erb :index
    #index needs a log in/ sign up button and request button also redirects to login
  end

  get '/add' do
    #need to run check to see if user is logged in
    erb :add
  end

  post '/add' do
    p params
    Property.add(name: params['name'], description: params['description'], price: params['price'], availability: Property.to_boolean(params['available']), user_id: session[:user_id])
    redirect '/'
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    #check user against db and login
    redirect '/'
  end

  post '/register' do
    User.add_new_user(email: params['email'], password: params['password'])
    #log in user automatically
    redirect '/'
  end

  run! if app_file == $0

end
