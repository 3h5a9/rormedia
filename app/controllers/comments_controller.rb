class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :required_comment_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:success] = "Comment Published Successfully"
      redirect_to post_path(@post)
    else
      flash[:danger] = "There is a problem."
      redirect_to post_path(@post)
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:success] = "Comment updated successfully"
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:danger] = "Comment Deleted Successfully."
    redirect_to post_path(@post)
  end


  private
  def comment_params
    params.require(:comment).permit(:name, :content)
  end

  def required_comment_user!
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    unless @comment.user_id == current_user.id
      redirect_to post_path(@post)
      flash[:danger] = "Sorry you are not authorized to perform this action!"
    end
  end
end
