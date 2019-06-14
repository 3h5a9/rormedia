class PagesController < ApplicationController
  def index
    @posts = Post.order("Created_at desc")
  end
end
