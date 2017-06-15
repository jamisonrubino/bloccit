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
  end

  def new
  end

  def edit
  end
end