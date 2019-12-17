class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      # t.bigint :category_id,     null: false, foreign_key: true
      # t.bigint :brand_id,        foreign_key: true
      # t.bigint :genre_id,        null: false, foreign_key: true
      # t.bigint :image_id,        null: false, foreign_key: true
      t.string :name,               null: false
      t.integer :status,             null: false
      t.string :size
      t.integer :price,              null: false
      t.text :description,           null: false
      t.string :burden,              null: false
      t.string :send_method,               null: false
      t.string :region,              null: false
      t.string :date
      t.datetime :created_at,        null: false
      t.datetime :updated_at,       null: false
      t.bigint :buyer_id,        foreign_key: {to_table: :users}
      t.bigint :seler_id,        null: false, foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
