class CreateCombos < ActiveRecord::Migration
  def change
    create_table :combos do |t|
      t.string :character
      t.string :difficulty
      t.integer :damage
      t.string :command
      t.attachment :image
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
