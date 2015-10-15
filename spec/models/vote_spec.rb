require "rails_helper"

describe Vote do
  include TestFactories

  describe "validations" do
    let(:vote) { associated_post.votes.create(value: 1, post_id: 1) }

    describe "value validation" do
      it "only allows -1 or 1 as values" do
        vote.value = 2
        expect(vote.save).to eq(false)
      end
    end
  end

  describe "after_save" do
    it "calls 'Post#update_rank' after save" do
      post = associated_post
      vote = Vote.new(value: 1, post: post)
      expect(post).to receive(:update_rank)
      vote.save
    end
  end
end
