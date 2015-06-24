# enable :sessions
before '/secret/:id' do
	puts "entramos"

	if session[:email] == nil
		puts "No existe una sesion"
		session[:error] = "no existe una sesion"
		# @error = session[:error]
		redirect to("/")
	end
end

get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  @error = session[:error]
  erb :index
end

# get '/:error' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  # erb :index
# end

post '/login' do
	session[:email] = params[:email]
	email = session[:email]
	password = params[:password]
	user = User.authenticate(email, password)
	if user
		# erb :secret
		redirect to("/secret/#{user.id}")
	else
		erb :index
	end
end

get '/signup' do
	erb :signup
end

post '/signup' do
	name = params[:name]
	email = params[:email]
	password = params[:password]
	user = User.create(name: name, email: email, password: password)
	redirect to('/secret/#{user.id}')
end

get '/secret/:id' do
	id = params[:id]
	@user = User.find(id)
	puts session
	erb :secret
end

post '/logout' do
  session.clear
  redirect to('/')
end