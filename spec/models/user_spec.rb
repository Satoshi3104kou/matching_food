require 'rails_helper'
describe User do
  
  describe '#create' do
    it "is valid with store_name, email, password, phone_num" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a nickname" do
      user = build(:user, store_name: "")
      user.valid?
      expect(user.errors[:store_name]).to include("を入力してください")
    end

    it "is invalid without an email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "is invalid without a password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "is invalid without a password" do
      user = build(:user, phone_num: "")
      user.valid?
      expect(user.errors[:phone_num]).to include("を入力してください")
    end

    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "is valid with a password that has more than 7 characters" do
      user = build(:user, password: "eeee0000", password_confirmation: "eeee0000")
      user.valid?
      expect(user).to be_valid
    end
  end
end