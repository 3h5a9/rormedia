class PagesController < ApplicationController
  def index
    @posts = Post.order("Created_at desc")
  end

  def contact
    @message = Message.new
  end
end
