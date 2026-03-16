class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.references :user,    foreign_key: true
      t.string  :name,       null: false
      t.string  :email,      null: false
      t.string  :address,    null: false
      t.string  :phone
      t.decimal :total,      precision: 10, scale: 2
      t.string  :status,     default: 'pending'
      t.timestamps
    end

    create_table :order_items do |t|
      t.references :order, null: false, foreign_key: true
      t.references :book,  null: false, foreign_key: true
      t.integer :quantity,   default: 1
      t.decimal :unit_price, precision: 10, scale: 2
      t.timestamps
    end
  end
end
