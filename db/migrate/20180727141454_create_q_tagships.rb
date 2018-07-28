class CreateQTagships < ActiveRecord::Migration[5.1]
  def change
    create_table :q_tagships do |t|
      t.integer :question_id, foreign_key: true
      t.integer :hashtag_id, foreign_key: true
      t.timestamps
    end
  end
end
