class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'アクセサリー' },
    { id: 3, name: 'インテリア' },
    { id: 4, name: 'ファッション' },
    { id: 5, name: 'ベビー・キッズ' },
    { id: 6, name: 'ファッション小物' },
    { id: 7, name: '雑貨' },
    { id: 8, name: 'その他' }

  ]
  include ActiveHash::Associations
  has_many :items
end
