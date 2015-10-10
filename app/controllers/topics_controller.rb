class TopicsController < ApplicationController
  def index
    @topics = Topic.paginate(page: params[:page], per_page: 10)
    authorize @topics
  end

  def new
    @topic = Topic.new
    authorize @topic
  end

  def create
    @topic = Topic.new(topic_params)
    authorize @topic
    if @topic.save
      flash[:notice] = "Topic was saved"
      redirect_to @topic
    else
      flash[:error] = "There was a problem"
      render :new
    end
  end

  def show
    @topic = Topic.find(params[:id])
    @posts = @topic.posts.paginate(page: params[:page], per_page: 10)
    authorize @topic
  end

  def edit
    @topic = Topic.find(params[:id])
    authorize @topic
  end

  def update
    @topic = Topic.find(params[:id])
    authorize @topic
    if @topic.update_attributes(topic_params)
      flash[:notice] = "Topic updated"
      redirect_to @topic
    else
      flash[:error] = "There was a problem"
      render :edit
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:name, :descripton, :public)
  end
end
