require "rails_helper"

describe Vote do
  describe "validations" do
    let(:vote) { described_class.create(value: 1) }

    describe "value validation" do
      it "only allows -1 or 1 as values" do
        vote.value = 2
        expect(vote.save).to eq(false)
      end
    end
  end
end
