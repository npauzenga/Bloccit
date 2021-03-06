class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    @comment = @post.comments.new(comment_params)
    @comment.post = @post
    @comment.user = current_user
    @new_comment = Comment.new

    authorize @comment
    if @comment.save
      flash[:notice] = "Comment submitted!"
    else
      flash[:error] = "Comment did not save correctly"
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed."
    else
      flash[:error] = "There was an issue"
    end
  end

  respond_to do |format|
    format.html
    format.js
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
