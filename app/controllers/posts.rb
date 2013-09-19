############GET############


get '/post/:id' do
	@post = Post.find(params[:id])
	@tags = @post.tags
	erb :post
end

get '/new' do
	erb :new
end



############POST###########


post '/new' do
	if params[:post].has_blank?
		@error = "Please enter both a title and body"
		erb :new
	else
		@post = Post.create(params[:post])
		tag_array = params[:tags].gsub(/\s/,"").split(",")
		
		tag_array.each do |tag|
			@post.tags << Tag.find_or_create_by_name(tag)
		end

		@posts = Post.all
		redirect to '/'
	end

end

post '/post/:id/edit' do
	@post = Post.find(params[:id])
	@tags = @post.tags
	@tags.map! {|tag| tag.name}.join(", ")
	erb :edit
end

post '/post/:id/delete' do
	@post = Post.find(params[:id]).destroy
	redirect to '/'
end
