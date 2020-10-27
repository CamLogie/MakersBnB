require 'sinatra/base'

class MakersBnB < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post '/sign_up' do
    session[:name] = params[:name]
    session[:user_name] = params[:user_name]
    redirect '/renting_or_hosting'
  end

  get '/renting_or_hosting' do
    erb :renting_or_hosting
  end


  run! if app_file == $0
end

