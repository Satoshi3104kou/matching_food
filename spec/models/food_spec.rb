require 'rails_helper'

describe Food do
  describe '#create' do

    it "is valid with  way, motivation, wards, table, people, time ,service" do
      food = build(:food)
      expect(food).to be_valid
    end

    it "is invalid without way" do
      food = build(:food, way: nil)
      food.valid?
      expect(food.errors[:way]).to include("を入力してください", "は1文字以上で入力してください")
    end



    it "is invalid without motivation" do
      food = build(:food, motivation:  nil)
      food.valid?
      expect(food.errors[:motivation]).to include("を入力してください", "は1文字以上で入力してください")
    end

    it "is invalid without wards" do
      food = build(:food, wards:  nil)
      food.valid?
      expect(food.errors[:wards]).to include("を入力してください", "は1文字以上で入力してください")
    end

    it "is invalid without table" do
      food = build(:food, table:  nil)
      food.valid?
      expect(food.errors[:table]).to include("を入力してください", "は1文字以上で入力してください")
    end

    it "is invalid without people" do
      food = build(:food, people:  nil)
      food.valid?
      expect(food.errors[:people]).to include("を入力してください", "は1文字以上で入力してください")
    end

    it "is invalid without time" do
      food = build(:food, time:  nil)
      food.valid?
      expect(food.errors[:time]).to include("を入力してください", "は1文字以上で入力してください")
    end

    it "is invalid without service" do
      food = build(:food, service: "")
      food.valid?
      expect(food.errors[:service]).to include("を入力してください", "は1文字以上で入力してください")
    end
  end
end 