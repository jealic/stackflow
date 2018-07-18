class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :topic
      t.text :content
      t.integer :user_id
      t.integer :answers_count, default: 0
      t.integer :upvotes_count, default: 0
      t.integer :favorites_count, default: 0

      t.timestamps
    end
  end
end
