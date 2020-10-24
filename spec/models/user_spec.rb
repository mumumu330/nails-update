require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.create(:user)
  end

  describe "バリデーションのテスト" do
    it "名がなければ無効な状態であること" do
      @user.name = ""
      @user.valid?
      expect(@user.errors[:name]).to include("can't be blank")
    end

    it "名が10文字以下でなければ無効な状態であること" do
      @user.name = "aaaaaaaaaaaaaaaaaaaaaaaaa"
      @user.valid?
      expect(@user.errors[:name]).to include("is too long (maximum is 10 characters)")
    end
  end
end
