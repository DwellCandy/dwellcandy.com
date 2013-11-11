require 'spec_helper'

describe User do
  it { should validate_presence_of :email }
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_uniqueness_of :email }
  it { should ensure_length_of(:password).is_at_least(6) }

  let!(:user) { create(:user) }
  context "email" do
    it "should be downcased" do
      user.email = "Test@Test.com"
      user.save
      expect(user.email).to eq "test@test.com"
    end
  end
end