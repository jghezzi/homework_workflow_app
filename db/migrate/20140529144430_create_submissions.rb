class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string :workflow_status
      t.integer :assignment_id
      t.integer :user_id

      t.timestamps
    end
  end
end
