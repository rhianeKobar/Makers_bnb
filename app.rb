require 'sinatra/base'
require 'sinatra/reloader'

class BNB < Sinatra::Base
  get '/' do
    "hello world"
  end

  run! if app_file == $0

end
