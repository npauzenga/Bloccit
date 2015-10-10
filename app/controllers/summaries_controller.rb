class SummariesController < ApplicationController
  def new
    @summary = Summary.new
    authorize @summary
  end

  def create
    @post = Post.find(params[:post_id])
    @summary = Summary.new(summary_params)
    @post.summary = @summary

    authorize @summary
    if @summary.save
      flash[:notice] = "Summary was saved."
      redirect_to post_summary_path
    else
      flash[:error] = "There was an error saving the Summary. Please try again."
      render :new
    end
  end

  def show
    @post = Post.find(params[:post_id])
    @summary = @post.summary
    if @summary.nil?
      flash[:notice] = "There is no summary"
      redirect_to @post
    end
  end

  private

  def summary_params
    params.require(:summary).permit(:body)
  end
end
