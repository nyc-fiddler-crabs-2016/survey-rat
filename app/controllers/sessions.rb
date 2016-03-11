get '/login' do
  erb :'/sessions/login'
end

post '/login' do
  @user = User.find_by(params[:user])
  if @user && @user.authenticate(params[:password][:password_digest]) 
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = "Either the username or password was incorrect."
    erb :'/sessions/login'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end
