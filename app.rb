require 'sinatra/base'
require './lib/property'
require_relative './lib/bnb_manager.rb'

class MakersBnB < Sinatra::Base
  
  enable :sessions

    # Sign up form/function
  get '/' do
    erb :index
  end

  get '/properties/add_new' do
    erb :add_property
  end

  post '/properties/add_new/id' do
    Property.add(params[:listing_title], params[:listing_description], params[:start_date], params[:end_date], params[:price_per_night], params[:listing_location], session[:user].id)
    redirect to('/properties')
  end

  get '/properties' do
    @property = Property.all
    erb(:properties_list)
  end

  post '/book-property/:id' do
    "I posted my info!"
    requested_date = params.values[0]
    property = Property.find_property(id: params[:id])
    session[:confirmation] = property.check_availability?(requested_date)
    redirect to '/confirmation-page'
  end

  post '/view_listing/:id' do 
    
    requested_date = params.values[0]
    session[:property_to_view] = Property.find_property(id: params[:id])
    redirect '/view_property'
  end

  get '/view_property' do 
    erb(:view_your_property)
  end

  get '/confirmation-page' do
    erb :confirmation_page
  end

  # This will collect the user info.
  post '/sign_up' do
    session[:error_msg] = false
    session[:manager] = BnBManager.new
    session[:user] = session[:manager].sign_up(
      name: params[:name], 
      user_name: params[:sign_up_user_name]
      )
    
    if session[:user].is_a? String
      session[:error_msg] = session[:user]
      redirect to '/'
    end
    redirect '/properties'
  end

  post '/sign_in' do
    session[:error_msg] = false
    session[:manager] = BnBManager.new
    session[:user] = session[:manager].sign_in(params[:sign_in_user_name])

    if session[:user].is_a? String
      session[:error_msg] = session[:user]
      redirect to '/'
    end
    redirect '/properties'
  end

  post '/log-out' do
    session[:user] = nil
    session[:manager] = nil
    redirect to '/'
  end

  run! if app_file == $0
end
