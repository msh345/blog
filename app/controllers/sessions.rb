enable :sessions

######################GET


get '/login' do
  erb :login
end

get '/signup' do
  erb :signup
end

get '/logout' do
  session.clear
  redirect to "/"

end

######################POST

post '/login' do
  @user = User.authenticate(params[:user])

  if @user != nil
    session[:user_id] = @user.id
    redirect to "/user/#{@user.id}"
  else
    erb :login
  end
    
end



