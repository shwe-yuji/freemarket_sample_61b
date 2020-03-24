class DeliveryMethod2 < ActiveHash::Base
  self.data = [
      # 着払い(購入者負担)を選択した時
      { id: 10, value: '未定'},
      { id: 11, value: 'クロネコヤマト'},
      { id: 12, value: 'ゆうパック'},
      { id: 13, value: 'ゆうメール'} 
  ]
end