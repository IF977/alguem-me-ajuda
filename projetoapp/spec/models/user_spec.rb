require 'rails_helper'
 
describe User do

  before do
    
    @stubs = test_faraday
    @stubs.get("/v1/verify?email=jrgvf@cin.ufpe.br") { [200, {}, File.read("spec/fixtures/emailexist.json")] }
    #@stubs.get("/v1/verify?email=jrgvff@cin.ufpe.br") { [200, {}, File.read("spec/fixtures/emailnotexist.json")] }

    @user = User.new(name: "Jorge Rodrigues", email: "jrgvf@cin.ufpe.br", password: "teste123", password_confirmation: "teste123")
    #@user = FactoryGirl.create(:user)

  end

  def test_faraday
    @stubs = Faraday::Adapter::Test::Stubs.new
    Faraday.default_connection = Faraday.new do |builder|
      builder.adapter :test, @stubs
    end
    @stubs
  end

  subject { @user }

  describe "User valid" do

    it "Should Respond to Name" do
      should respond_to(:name)
    end

    it "Should Respond to Email" do
      should respond_to(:email)
    end
  end
  
  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end

  

  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  # describe "when name is too long" do
  #   before { @user.name = "a" * 51 }
  #   it { should_not be_valid }
  # end

  # describe "when name is too short" do
  #   before { @user.name = "a" * 3 }
  #   it { should_not be_valid }
  # end

  # describe "when email format is invalid" do
  #   it "should be invalid" do
  #     addresses = %w[user@foo,com user_at_foo.org example.user@foo.
  #                    foo@bar_baz.com foo@bar+baz.com]
  #     addresses.each do |invalid_address|
  #       @user.email = invalid_address
  #       @user.should_not be_valid
  #     end
  #   end
  # end

  # describe "when email format is valid" do
  #   it "should be valid" do
  #     addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
  #     addresses.each do |valid_address|
  #       @user.email = valid_address
  #       @user.should be_valid
  #     end
  #   end
  # end
end