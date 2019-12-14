class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.integer :number,        null: false
      t.integer :expiration,    null: false
      t.string :name,           null: false
      t.integer :cvc,           null: false
      t.refrence :user,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
