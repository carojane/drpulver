class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.text :body, null: false
      t.string :title, null: false
      t.date :due_date, null: false
      t.references :course, null: false

      t.timestamps
    end
  end
end
