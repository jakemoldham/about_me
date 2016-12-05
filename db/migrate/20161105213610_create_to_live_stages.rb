class CreateToLiveStages < ActiveRecord::Migration
  def change
    create_table :to_live_stages do |t|
      t.string :title
      t.string :description

      t.timestamps null: false
    end
  end
end
