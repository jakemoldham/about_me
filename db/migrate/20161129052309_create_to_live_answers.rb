class CreateToLiveAnswers < ActiveRecord::Migration
  def change
    create_table :to_live_answers do |t|
      t.belongs_to :question, index: true
      t.string :answer
      t.boolean :choose
      t.boolean :correct

      t.timestamps null: false
    end
    add_foreign_key :to_live_answers, :to_live_questions, column: :question_id
  end
end
