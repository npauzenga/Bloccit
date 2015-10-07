class SummariesController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @summary = topic_post_summary_path # kind of a bandaid
    # authorize @summary # broken due to above hackery
  end

  def create
    @post = Post.find(params[:post_id])
    @summary = Summary.new(summary_params)
    @post.summary = @summary
    authorize @summary
    if @summary.save
      flash[:notice] = "Summary was saved."
      redirect_to [@topic, @post, @summary] # nope
    else
      flash[:error] = "There was an error saving the Summary. Please try again."
      render :new
    end
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
