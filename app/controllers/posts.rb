############GET############


get '/post/:id' do
	@post = Post.find(params[:id])
	@tags = @post.tags
	erb :post
end

get '/new' do
	erb :new
end

get '/post/:id/edit' do
	@post = Post.find(params[:id])
	@tags = @post.tags
	@tags = @tags.map! {|tag| tag.name}.join(", ")
	erb :edit
end


############POST###########


post '/new' do
	if params[:post].has_blank?
		@error = "Please enter both a title and body"
		erb :new
	else
		@post = Post.create(params[:post])
		redirect to '/'
	end

end

post '/new/:id' do
	if params[:post].has_blank?
		@error = "Please enter both a title and body"
		erb :new
	else
		user = User.find(params[:id])
		@post = user.posts.create(params[:post])
		redirect to '/'
	end
end


post '/post/:id' do
	@post = Post.find(params[:id])
	@post.update_attributes(params[:post])
	redirect to "/post/#{params[:id]}"
end

post '/post/:id/delete' do
	@post = Post.find(params[:id]).destroy
	redirect to '/'
end
