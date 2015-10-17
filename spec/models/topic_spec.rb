require "rails_helper"

describe Topic do
  include TestFactories
  describe "scopes" do
    describe "publicly_viewable" do
      it "returns a relation of all public topics" do
        expect(described_class.publicly_viewable).to eq([public_topic])
      end
    end

    describe "privately_viewable" do
      it "returns a relation of all private topics" do
        expect(described_class.privately_viewable).to eq([private_topic])
      end
    end

    describe "visible_to(user)" do
      it "returns all topics if the user is present" do
        user = User.new
        expect(described_class.visible_to(user)).to eq(described_class.all)
      end

      it "returns only public topics if user is nil" do
        user = nil
        expect(described_class.visible_to(user)).to eq([public_topic])
      end
    end
  end
end
