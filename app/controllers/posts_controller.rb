class PostsController < ApplicationController
  def index
    @posts = Post.all
    @posts[0].title = "SPAM"
    @posts.length.times do |i|
      if i%5 === 0
        @posts[i].title = "SPAM"
      end
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
   @post = Post.new
  end
  
  def create
 # #9
   @post = Post.new
   @post.title = params[:post][:title]
   @post.body = params[:post][:body]

 # #10
   if @post.save
 # #11
     flash[:notice] = "Post was saved."
     redirect_to @post
   else
 # #12
     flash.now[:alert] = "There was an error saving the post. Please try again."
     render :new
   end
  end

  def edit
  end
end