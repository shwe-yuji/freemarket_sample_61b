require 'rails_helper'

RSpec.describe Destination, type: :model do
  require 'rails_helper'
  describe '#create' do
    before do
      @area = FactoryBot.create(:area,name:"福岡県")
    end

    it "全項目有りの登録" do
      area = @area
      destination = area.destinations.build(
        user_id:               1,
        lastname:              "技術",
        lastname_kana:         "てっく",
        firstname:             "玄人",
        firstname_kana:        "えきすぱーと",
        postal_code:           "0000000",
        area_id:               1,
        city:                  "渋谷区",
        street_address:        "道玄坂"
  )
      expect(destination).to be_valid
    end
    it "ユーザ情報なしの登録" do
      destination = build(:destination)
         destination.valid?
         expect(destination.errors[:user_id]).to include()
    end
    it "名前なしの登録" do
      destination = build(:destination, firstname: nil)
         destination.valid?
         expect(destination.errors[:firstname]).to include("を入力してください")
    end

    it "苗字なしの登録" do
      destination = build(:destination, lastname: nil)
         destination.valid?
         expect(destination.errors[:lastname]).to include("を入力してください")
    end

    it "名前ふりがななしの登録" do
      destination = build(:destination, firstname_kana: nil)
         destination.valid?
         expect(destination.errors[:firstname_kana]).to include("を入力してください")
    end

    it "苗字ふりがな無しの登録" do
      destination = build(:destination, lastname_kana: nil)
         destination.valid?
         expect(destination.errors[:lastname_kana]).to include("を入力してください")
    end
    it "郵便番号なしの登録" do
      destination = build(:destination, postal_code: nil)
         destination.valid?
         expect(destination.errors[:postal_code]).to include("を入力してください")
    end
    it "都道府県名無しの登録" do
      destination = build(:destination, area_id: nil)
         destination.valid?
         expect(destination.errors[:area_id]).to include("を入力してください")
    end
    it "市区町村名無しの登録" do
      destination = build(:destination, city: nil)
         destination.valid?
         expect(destination.errors[:city]).to include("を入力してください")
    end
    it "番地名無しの登録" do
      destination = build(:destination, street_address: nil)
         destination.valid?
         expect(destination.errors[:street_address]).to include("を入力してください")
    end
  end
end

