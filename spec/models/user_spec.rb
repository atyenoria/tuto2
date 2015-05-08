

require 'rails_helper'

RSpec.describe User, type: :model do


describe User do

  before do
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:authenticate) }
  it { should respond_to(:admin) }

  it { should be_valid }
  it { should_not be_admin }

  describe "with admin attribute set to 'true'" do
    before do
      @user.save!
      @user.toggle!(:admin)
    end

    it { should be_admin }
  end

ra
  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end


   describe "remember token" do
    before { @user.save }
    it { expect(@user.remember_token).not_to be_blank }
    #its(:remember_token) { should_not be_blank } 使えない？？
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



  describe "when password is not present" do
    before do
      @user = User.new(name: "Example User", email: "user@example.com",
                       password: " ", password_confirmation: " ")
    end
    it { should_not be_valid }
  end




end



 
end



