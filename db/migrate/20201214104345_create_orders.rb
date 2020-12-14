class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string      :address_code,      null: false
      t.integer     :prefecture_id,     null: false
      t.string      :city,              null: false
      t.string      :address_number,    null: false
      t.string      :house_name
      t.string      :tel,               null: false, unique: true
      t.references  :user,              foreign_key: true
      t.references  :item,              foreign_key: true
      t.timestamps
    end
  end
end
