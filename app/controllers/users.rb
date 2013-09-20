############get

get '/user/:id' do
  if session[:user_id] == params[:id].to_i
    @user = User.find(params[:id])
    @posts = @user.posts

    erb :my_posts
  else
    redirect to '/login'  
  end

end


get '/user/:id/posts' do
	@user = User.find(params[:id])
	@posts = @user.posts
	erb :user_posts
end


post '/signup' do
  @user = User.create(params[:user])
  session[:user_id] = @user.id
  redirect to "/user/#{@user.id}"
end
