class CreateToLiveQuestions < ActiveRecord::Migration
  def change
    create_table :to_live_questions do |t|
      t.string :title
      t.string :body

      t.timestamps null: false
    end
  end
end
