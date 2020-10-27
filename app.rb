require 'sinatra/base'

class MakersBnB < Sinatra::Base

  enable :sessions

  # Sign up form/function
  get '/' do
    erb :index
  end

  # This will collect the user info.
  post '/sign_up' do
    session[:user] = MakersBnB.sign_up(name: params[:name], user_name: params[:user_name])
    redirect '/renting_or_hosting'
  end

  # This is the landing page for renting or hosting
  get '/renting_or_hosting' do
    erb :renting_or_hosting
  end


  run! if app_file == $0
end

