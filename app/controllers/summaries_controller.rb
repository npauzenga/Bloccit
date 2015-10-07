class SummariesController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @summary = topic_post_summary_path
    #authorize @summary
  end

  def create
    @post = Post.find(params[:post_id])
    @summary = Summary.new(summary_params)
    @post.summary = @summary
    # Authorize and redirect
  end

  def show
    @post = Post.find(params[:post_id])
    @summary = Summary.find(params[:post_id])
    authorize @summary
  end

  private

  def summary_params
    params.require(:summary).permit(:body)
  end
end
