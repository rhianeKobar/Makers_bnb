require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/property.rb'
require_relative './db/queries/pg_connect.rb'
require_relative './lib/user'

class BNB < Sinatra::Base
  
  enable :sessions

  DB.connect

  get '/' do
    @user = User.find_user(id: session[:user_id])
    @properties = Property.all
    erb :index
    #index needs a log in/ sign up button and request button also redirects to login
  end

  get '/add' do
    #need to run check to see if user is logged in
    @user = User.find_user(id: session[:user_id])
    redirect('/') if @user.nil? 
    erb :add
  end

  post '/add' do
    Property.add(name: params['name'], description: params['description'], price: params['price'], availability: params['available'], user_id: session[:user_id])
    redirect '/'
  end

  get '/logout' do
    session.clear
    redirect('/')
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    user = User.authenticate(email: params['login_email'], password: params['login_password'])
    if user 
      session[:user_id] = user.id 
      redirect '/'
    else 
      session[:error] = 'Incorrect email or password - Please try again'
      redirect('/login')
    end
  end

  post '/register' do
    user = User.add_new_user(email: params['register_email'], password: params['register_password'])
    session[:user_id] = user.id
    #log in user automatically
    redirect '/'
  end

  get '/my-requests' do
    @user = User.find_user(id: session[:user_id])
    redirect('/') if @user.nil? 
    @requests = Property.get_requests(user_id: @user.id)
    erb :requests
  end

  post '/request-book/:id' do
    @requester = User.find_user(id: session[:user_id])
    User.send_booking_request(requester_id: @requester.id , property_id: params["id"])
    redirect '/'
  end

  get '/accept' do
    redirect '/'
  end

  run! if app_file == $0

end
