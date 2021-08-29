class Category < ActiveHash::Base
  self.data = [
    {name: 'メンズ'}, {name: 'レディース'},
    {name: 'ベビー・キッズ'}, {name: 'インテリア・住まい・小物'}, {name: '本・音楽・ゲーム'},
    {name: 'おもちゃ・ホビー・グッズ'}, {name: '家電・スマホ・カメラ'}, {name: 'スポーツ・レジャー'},
    {name: 'ハンドメイド'},{name: 'その他'}
  ]

  include ActiveHash::Associations
  has_many :item
end