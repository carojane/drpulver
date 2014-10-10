class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.references :user, null: false
      t.references :course, null: false

      t.timestamps
    end
    add_index :enrollments, [:user_id, :course_id], unique: true
  end
end
