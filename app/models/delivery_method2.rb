class DeliveryMethod2 < ActiveHash::Base
  self.data = [
      # 着払い(購入者負担)を選択した時
      { id: 1, value: '未定'},
      { id: 6, value: 'クロネコヤマト'},
      { id: 7, value: 'ゆうパック'},
      { id: 3, value: 'ゆうメール'},
  ]
end