require 'rails_helper'

describe ProductsController, type: :controller do
  describe 'Delete #destroy' do
    it "商品の削除" do
      product = create(:product)
      expect{
        delete :destroy, params: { id: product }
      }.to change(Product,:count).by(-1)
    end
  end
end