require 'sinatra/base'
require './lib/property'

class MakersBnB < Sinatra::Base
  get '/' do
    'hello world'
  end

  get '/properties/add_new' do
    erb :add_property
  end

  post '/properties/add_new/id' do
    Property.add(params[:listing_title], params[:listing_description])
    redirect to('/properties')
  end

  get '/properties' do
    @property = Property.all
    erb(:properties_list)
    # Property.all.each {|property| puts property}
  end

  run! if app_file == $0
end
