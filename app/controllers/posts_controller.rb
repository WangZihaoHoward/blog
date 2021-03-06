class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(params[:post])
		if @post.save
			redirect_to posts_path, :notice => "Successfully created!"
		else
			render "new"
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
    	respond_to do |format|
	      if @post.update_attributes(params[:post])
	        format.html { redirect_to @post, notice: 'Blog was successfully updated.' }
	      else
	        format.html { render action: "edit" }
	      end
	    end
	end

	def destroy
		@post = Post.find(params[:id])
    	@post.destroy
	    respond_to do |format|
	      format.html { redirect_to posts_url }
	    end
	end
end
