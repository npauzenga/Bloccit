class SummariesController < ApplicationController
  def new
    @summary = Summary.new
    authorize @summary
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.new(summary_params)
    @post.summary = @summary

    authorize @summary
    if @summary.save
      flash[:notice] = "Summary was saved."
      redirect_to topic_post_summary_path
    else
      flash[:error] = "There was an error saving the Summary. Please try again."
      render :new
    end
  end

  def show
    @post = Post.find(params[:post_id])
    @summary = @post.summary
    authorize @summary
  end

  private

  def summary_params
    params.require(:summary).permit(:body)
  end
end
