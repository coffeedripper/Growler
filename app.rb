require 'sinatra'
require 'sinatra/reloader'

enable :sessions

before do
	session[:growls] ||= []
end

# Routes
get '/' do 

	erb :index
end

get '/add' do
	
	erb :add
end

get '/growls' do
	@growls = session[:growls]
	@growls.reverse!
	erb :growls
end

post '/add' do
	growl = params[:new_growl]
	session[:growls].push(growl)
	
	erb :add #question? redirect or not?
end
