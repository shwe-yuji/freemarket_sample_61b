class ShippingMethod < ActiveHash::Base
  self.data = [
      { id: 1, value: '未定' }, { id: 2, value: 'らくらく便' }, { id: 3, value: 'ゆうメール' },
      { id: 4, value: 'レターパック' }, { id: 5, value: '普通郵便(定形、定形外)' }, { id: 6, value: '普通郵便(定形、定形外)' },
      { id: 7, value: 'ゆうパック' }, { id: 8, value: 'クリックポスト' }, { id: 9, value: 'ゆうパケット' }
  ]
end