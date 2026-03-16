class CreateBooksAndCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.timestamps
    end

    create_table :books do |t|
      t.string     :title,       null: false
      t.string     :author,      null: false
      t.string     :publisher
      t.integer    :year
      t.integer    :pages
      t.string     :isbn
      t.text       :description
      t.decimal    :price,       precision: 10, scale: 2, null: false
      t.string     :cover_image
      t.references :category,   foreign_key: true
      t.boolean    :featured,    default: false
      t.timestamps
    end
  end
end
