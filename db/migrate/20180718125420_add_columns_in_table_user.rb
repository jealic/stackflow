class AddColumnsInTableUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :role, :string
    add_column :users, :name, :string
    add_column :users, :company, :string
    add_column :users, :position, :string
    add_column :users, :introduction, :text
    add_column :users, :website, :string
    add_column :users, :twitter, :string
    add_column :users, :github, :string
    add_column :users, :image, :string
  end
end