class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :description
      t.string :cohort_id

      t.timestamps
    end
  end
end
