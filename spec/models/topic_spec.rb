require "rails_helper"

describe Topic do
  describe "scopes" do

     let(:public_topic) do
       described_class.create(name:       "Topic Name",
                              description: "Topic description")
      end
     let(:private_topic) do
       described_class.create(name:        "Topic Name",
                              description: "Topic description",
                              public:      false)
      end

   describe "publicly_viewable" do
     it "returns a relation of all public topics" do
       expect(described_class.publicly_viewable).to eq( [public_topic] )
     end
   end

   describe "privately_viewable" do
     it "returns a relation of all private topics" do
       expect(described_class.privately_viewable).to eq( [private_topic] )
     end
   end

   describe "visible_to(user)" do
     it "returns all topics if the user is present" do
       user = User.new
       expect(described_class.visible_to(user)).to eq( described_class.all )
     end

     it "returns only public topics if user is nil" do
       user = nil
       expect(described_class.visible_to(user)).to eq( [public_topic] )
     end
   end
  end
end
