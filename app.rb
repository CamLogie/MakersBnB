require 'sinatra/base'
require './lib/property'
require_relative './lib/bnb_manager.rb'

class MakersBnB < Sinatra::Base
  
  enable :sessions
  
#   get '/' do
#     'hello world'
#   end

  get '/properties/add_new' do
    erb :add_property
  end

  post '/properties/add_new/id' do
    Property.add(params[:listing_title], params[:listing_description], params[:start_date], params[:end_date])
    redirect to('/properties')
  end

  get '/properties' do
    @property = Property.all
    erb(:properties_list)
    # Property.all.each {|property| puts property}
  end

  # Sign up form/function
  get '/' do
    erb :index
  end

  # This will collect the user info.
  post '/sign_up' do
    session[:error_msg] = false
    session[:manager] = BnBManager.new
    session[:user] = session[:manager].sign_up(
      name: params[:name], 
      user_name: params[:user_name]
      )
    if session[:user].is_a? String
      session[:error_msg] = session[:user]
      redirect to '/'
    end

    redirect '/properties'
  end

  # This is the landing page for renting or hosting
#   get '/renting_or_hosting' do
#     erb :renting_or_hosting
#   end

  run! if app_file == $0
end
