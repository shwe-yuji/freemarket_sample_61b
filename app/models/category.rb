class Category < ActiveHash::Base
  self.data = [
      { id: 1, value: 'レディース' }, { id: 2, value: 'メンズ' },  {id: 3, value: 'ベビー・キッズ' },
      { id: 4, value: 'インテリア・住まい・小物' }, { id: 5, value: '本・音楽・ゲーム' },  { id: 6, value: 'おもちゃ・ホビー・グッズ' },
      { id: 7, value: 'コスメ・香水・美容' }, { id: 8, value: '家電・スマホ・カメラ' },  { id: 9, value: 'スポーツ・レジャー' },
      { id: 10, value: 'ハンドメイド' }, { id: 11, value: 'チケット' },  { id: 12, value: '自動車・オートバイ' },
      { id: 13, value: 'その他' }
  ]
end