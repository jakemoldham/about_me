class CreateToLivePlayers < ActiveRecord::Migration
  def change
    create_table :to_live_players do |t|
      t.string :name
      t.integer :wins

      t.timestamps null: false
    end
  end
end
