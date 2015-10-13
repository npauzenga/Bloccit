class VotesController < ApplicationController
  before_action :load_post_and_vote

  def up_vote
    update_vote!
    redirect_to :back
  end

  def down_vote
    update_vote!
    redirect_to :back
  end

  private

  def load_post_and_vote
    @post = Post.find(params[:post_id])
    @vote = @post.votes.where(user_id: current_user.id).first
  end

  def update_vote!(new_value)
    if @vote
      @vote.update_attribute(:value, 1)
    else
      @vote = current_user.votes.create(value: 1, post: @post)
    end
  end
end
