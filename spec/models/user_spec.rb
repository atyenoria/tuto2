

require 'rails_helper'

RSpec.describe User, type: :model do


describe User do

  before { @user = User.new(name: "Example User", email: "user@example.com") }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }



 	it { should be_valid }

  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end



   describe "when name is too long" do
    before { @user.name = "a" * 51 }
    it { should_not be_valid }
  end




  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.save
      user_with_same_email.email = @user.email.upcase
    end

    it { should_not be_valid }
  end




end


# 
end



