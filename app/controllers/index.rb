get '/' do
	@posts = Post.all
	@users = User.all

  erb :index
end
