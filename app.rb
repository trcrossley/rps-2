require 'sinatra/base'

class RPS < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/name' do
    session[:name] = params[:name]
    redirect '/play'
  end

  get '/play' do
    # @turn = Turn.new(session)
    @name = session[:name]
    @weapon = session[:weapon]
    @comp_weapon = session[:comp_weapon]
    erb :play
  end

  post '/play' do
    session[:weapon] = params[:weapon]
    session[:comp_weapon] = :rock
    redirect '/play'
  end

  run! if app_file == $0
end
