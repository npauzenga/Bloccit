class SummariesController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @summary = @post.build_summary
    authorize @summary
  end

  def create
    @post = Post.find(params[:post_id])
    @summary = @post.build_summary(summary_params)

    authorize @summary
    if @summary.save
      flash[:notice] = "Summary was saved."
      redirect_to @summary
    else
      flash[:error] = "There was an error saving the Summary. Please try again."
      render :new
    end
  end

  def show
    @summary = Summary.find(params[:id])
    @post = @summary.post
    if @summary.nil?
      flash[:notice] = "There is no summary"
      redirect_to @post
    end
  end

  def edit
    @post = Post.find(params[:id])
    @summary = @post.summary
    authorize @summary
  end

  def update
    @summary = Summary.find(params[:id])
    @post = @summary.post
    authorize @summary

    if @summary.update_attributes(params.require(:summary).permit(:body))
      flash[:notice] = "Summary was updated."
      redirect_to @summary
    else
      flash[:error] = "There was an error saving the Summary. Please try again."
      render :edit
    end
  end

  private

  def summary_params
    params.require(:summary).permit(:body)
  end
end
