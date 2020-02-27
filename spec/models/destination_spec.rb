require 'rails_helper'

RSpec.describe Destination, type: :model do
  require 'rails_helper'
  describe '#create' do
    it "全項目有りの登録可能" do
      user = create(:user)
      destination = build(:destination)
      expect(destination).to be_valid
    end
    it "ユーザ情報なしの登録不可" do
      destination = build(:destination)
         destination.valid?
         expect(destination.errors[:user_id]).to include()
    end
    it "名前なしの登録不可" do
      destination = build(:destination, firstname: nil)
         destination.valid?
         expect(destination.errors[:firstname]).to include("を入力してください")
    end

    it "苗字なしの登録不可" do
      destination = build(:destination, lastname: nil)
         destination.valid?
         expect(destination.errors[:lastname]).to include("を入力してください")
    end

    it "名前ふりがななしの登録不可" do
      destination = build(:destination, firstname_kana: nil)
         destination.valid?
         expect(destination.errors[:firstname_kana]).to include("を入力してください")
    end

    it "苗字ふりがな無しの登録不可" do
      destination = build(:destination, lastname_kana: nil)
         destination.valid?
         expect(destination.errors[:lastname_kana]).to include("を入力してください")
    end
    it "郵便番号なしの登録不可" do
      destination = build(:destination, postal_code: nil)
         destination.valid?
         expect(destination.errors[:postal_code]).to include("を入力してください")
    end
    it "都道府県名無しの登録不可" do
      destination = build(:destination, area_id: nil)
         destination.valid?
         expect(destination.errors[:area_id]).to include("を入力してください")
    end
    it "市区町村名無しの登録不可" do
      destination = build(:destination, city: nil)
         destination.valid?
         expect(destination.errors[:city]).to include("を入力してください")
    end
    it "番地名無しの登録不可" do
      destination = build(:destination, street_address: nil)
         destination.valid?
         expect(destination.errors[:street_address]).to include("を入力してください")
    end
  end
end

