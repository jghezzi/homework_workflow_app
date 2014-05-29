class CreateSubmissionLinks < ActiveRecord::Migration
  def change
    create_table :submission_links do |t|
      t.string :description
      t.integer :submission_id

      t.timestamps
    end
  end
end
