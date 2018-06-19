require 'rails_helper'

RSpec.describe Wiki, type: :model do
  let(:wiki) {Wiki.create!(title: "Wiki title", body: "This is a wiki body", private: false)}

  describe "attributes" do

    it "has title, body and private attributes" do

      expect(wiki).to have_attributes(title: "Wiki title", body: "This is a wiki body", private: false)
    end
  end
end
