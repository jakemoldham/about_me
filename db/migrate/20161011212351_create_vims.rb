class CreateVims < ActiveRecord::Migration
  def change
    create_table :vims do |t|
      t.string :title
      t.text :code
      t.string :description

      t.timestamps null: false
    end
  end
end
