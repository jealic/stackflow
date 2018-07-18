class RepairColumnInUserTable < ActiveRecord::Migration[5.1]
  def change
    rename_column :users,:position,:title
    rename_column :users,:introduction,:intro
    add_column :users,:questions_count,:integer,default:0
    add_column :users,:answers_count,:integer,default:0
  end
end
