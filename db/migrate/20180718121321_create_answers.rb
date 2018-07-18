class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.text     :content
      t.integer  :user_id
      t.integer  :question_id
      t.integer  :upvotes_count, default: 0

      t.timestamps
    end
  end
end
