class DeliveryMethod < ActiveHash::Base
  self.data = [
      # 送料込み(出品者負担)を選択した時
      { id: 1, value: '未定'}, 
      { id: 2, value: 'らくらく便' }, 
      { id: 3, value: 'ゆうメール'},
      { id: 4, value: 'レターパック' }, 
      { id: 5, value: '普通郵便(定形、定形外)' }, 
      { id: 6, value: 'クロネコヤマト' },
      { id: 7, value: 'ゆうパック' }, 
      { id: 8, value: 'クリックポスト' }, 
      { id: 9, value: 'ゆうパケット' },
  ]
end