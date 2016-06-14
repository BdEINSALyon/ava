class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :first_name
      t.integer :study_year_id
      t.integer :department_id
      t.integer :student_card
      t.date :birthday
      t.string :email
      t.string :phone
      t.string :gender

      t.timestamps null: false
    end
  end
end
