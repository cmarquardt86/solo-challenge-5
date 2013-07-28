enable :sessions

get '/' do
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  erb :sign_in
end

post '/sessions' do
  @user = User.find_by_email(params[:email])
  if @user && @user.password == params[:password]
  	session[:user_id] = @user.id
  	redirect '/'
  else
  	@flash_alert = "Could not log you in!"
  	erb :sign_in
  end
end

delete '/sessions/:id' do
  session.clear
end

#----------- USERS -----------

get '/users/new' do
  @user = User.new
  erb :sign_up
end

post '/users' do
  @user = User.new(params[:user])
  	if @user.save
  		session[:user_id] = @user.id
  		redirect '/'
  	else
  		@flash_alert = "Could not create user! <br />" + @user.errors.full_messages.join("<br />")
		erb :sign_up
	end
end
