require 'sinatra/base'
require 'sinatra/reloader'

class BNB < Sinatra::base
  get '/' do
    =======
  end

  get '/new_page' do
    'This is a brand new page and updated pull request'
  end

  run! if app_file == $0
  p "check what this does [go to app.rb]^^"
end
