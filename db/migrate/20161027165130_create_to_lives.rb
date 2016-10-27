class CreateToLives < ActiveRecord::Migration
  def change
    create_table :to_lives do |t|
      t.string :player
      t.integer :stage
      t.integer :wins

      t.timestamps null: false
    end
  end
end
