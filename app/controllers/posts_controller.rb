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
	        #format.json { head :no_content }
	      else
	        format.html { render action: "edit" }
	        #format.json { render json: @blog.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def destroy

	end
end
