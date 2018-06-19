require 'rails_helper'

RSpec.describe Wiki, type: :model do
  let(:user) {User.create!(email: "BlocHead@gmail.com", password: "password")}
  let(:wiki) {Wiki.create!(title: "New Title", body: "New body", user: user)}
  describe "attributes" do

    it "has title and body attributes" do

      expect(wiki).to have_attributes(title: "New Title", body: "New body")
    end
  end
end
