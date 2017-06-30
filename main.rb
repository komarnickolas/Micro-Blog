require 'sinatra'
require 'sinatra/activerecord'
require './models'

enable :sessions
set :database, 'sqlite3:blog.sqlite3'

get '/' do
  erb :index
end

get '/games' do
  erb :games
end

get '/popular' do
  erb :popular
end

get '/trending' do
  erb :trending
end

get '/profile' do
  erb :profile
end

post '/sign_in' do
  session[:user] = User.find_by(username: params[:username])
  redirect '/' if session[:user] && session[:user].password != params[:password]
end