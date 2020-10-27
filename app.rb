require 'sinatra/base'
require_relative './lib/bnb_manager.rb'

class MakersBnB < Sinatra::Base

  enable :sessions

  # Sign up form/function
  get '/' do
    p "HERE!"
    erb :index
  end

  # This will collect the user info.
  post '/sign_up' do
    p "I'm signing up!"
    session[:manager] = BnBManager.new
    session[:user] = session[:manager].sign_up(
      name: params[:name], 
      user_name: params[:user_name]
      )
    redirect '/renting_or_hosting'
  end

  # This is the landing page for renting or hosting
  get '/renting_or_hosting' do
    p "I'm done signing up!'"
    erb :renting_or_hosting
  end


  run! if app_file == $0
end

