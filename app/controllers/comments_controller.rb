class CommentsController < ApplicationController
  def create
    @topic = Topic.find_by(params[:id])
    @post = Post.find_by(params[:id])
    @comment = Comment.new(comment_params)
    @user = current_user

    #authorize @comment
    if @comment.save
      flash[:notice] = "Comment submitted!"
      redirect_to [@topic, @post]
    else
      flash[:error] = "Comment did not save correctly"
      redirect_to [@topic, @post]
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
