require 'sinatra/base'
require './lib/property'

class MakersBnB < Sinatra::Base
  get '/' do
    'hello world'
  end

  get '/properties_list' do
    Property.all.each {|property| puts property}
  end

  run! if app_file == $0
end

