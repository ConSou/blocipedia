require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {User.create!(email: "test@test.com", password: "password")}
  describe "attributes" do

    it "has email and password attributes" do

      expect(user).to have_attributes(email: "test@test.com", password: "password")
    end
  end
end
