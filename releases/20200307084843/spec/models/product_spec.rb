require 'rails_helper'
describe Product do
  describe '#create' do
    it "商品名なしの出品" do
     product = Product.new(name: "")
     product.valid?
     expect(product.errors[:name]).to include("を入力してください")
    end
    it "商品の説明なしの出品" do
      product = Product.new(description: "")
      product.valid?
      expect(product.errors[:description]).to include("を入力してください")
    end

    it "カテゴリーなしの出品" do
      product = Product.new(category_id: "")
      product.valid?
      expect(product.errors[:category_id]).to include("を入力してください")
    end
    it "サイズなしの出品" do
      product = Product.new(size_id: "")
      product.valid?
      expect(product.errors[:size_id]).to include("を入力してください")
    end
    it "商品の状態なしの出品" do
      product = Product.new(condition_id: "")
      product.valid?
      expect(product.errors[:condition_id]).to include("を入力してください")
    end
    it "配送料負担なしの出品" do
      product = Product.new(delivery_expense_id: "")
      product.valid?
      expect(product.errors[:delivery_expense_id]).to include("を入力してください")
    end
    it "配送の方法なしの出品" do
      product = Product.new(delivery_method_id: "")
      product.valid?
      expect(product.errors[:delivery_method_id]).to include("を入力してください")
    end
    it "発送元の地域なしの出品" do
      product = Product.new(area_id: "")
      product.valid?
      expect(product.errors[:area_id]).to include("を入力してください")
    end
    it "発送までの日数なしの出品" do
      product = Product.new(shipdate_id: "")
      product.valid?
      expect(product.errors[:shipdate_id]).to include("を入力してください")
    end
    it "価格なしの出品" do
      product = Product.new(price: "")
      product.valid?
      expect(product.errors[:price]).to include("を入力してください")
    end
  end
end