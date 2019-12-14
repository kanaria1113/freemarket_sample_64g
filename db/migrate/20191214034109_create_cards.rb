class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.integer :number,        null: false
      t.integer :month,         null: false
      t.integer :year,          null: false
      t.string :name,           null: false
      t.integer :cvc,           null: false
      t.references :user,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
