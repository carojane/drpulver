class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name, null: false
      t.string :number, null: false, unique: true
      t.string :meeting_time
      t.text :description
      t.text :syllabus
      t.date :start_date, null: false
      t.date :end_date, null: false

      t.timestamps
    end
  end
end
