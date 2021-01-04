class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'マスク'},
    { id: 3, name: 'アクセサリー' },
    { id: 4, name: 'インテリア' },
    { id: 5, name: 'ファッション' },
    { id: 6, name: 'ベビー・キッズ' },
    { id: 7, name: 'ファッション小物' },
    { id: 8, name: 'スマホアクセサリー'},
    { id: 9, name: '雑貨' },
    { id: 10, name: 'その他' }

  ]
  include ActiveHash::Associations
  has_many :items
end
