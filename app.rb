require 'sinatra'
require 'sinatra/reloader'

enable :sessions

before do
	session[:growls] ||= []
	session[:name] ||= []
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
	erb :growls
end

post '/add' do
	max = 20
	name = params[:user_name]
	growl = params[:new_growl]
	
	if(growl.length > max)
		@msg = "You can't submit a value greater than #{max} characters."
		erb :add
	 else
	 	session[:name].push(name)
		session[:growls].push(growl)
		redirect '/add'
	end
end

get '/restart' do
	session.clear
	redirect '/growls'
end


