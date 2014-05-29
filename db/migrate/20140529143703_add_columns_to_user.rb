class AddColumnsToUser < ActiveRecord::Migration
  def change
  	add_column :users, :name, :string
  	add_column :users, :user_type, :string
  	add_column :users, :cohort_id, :integer
  end
end
