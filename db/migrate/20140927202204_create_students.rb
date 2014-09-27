class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.date :date_of_birth
      t.text :bio
      t.references :user, null: false

      t.timestamps
    end
  end
end
