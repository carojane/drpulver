class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.references :user, null: false
      t.references :assignment, null: false
      t.text :body, null: false

      t.timestamps
    end

    add_index :submissions, [:user_id, :assignment_id], unique: true
  end
end
