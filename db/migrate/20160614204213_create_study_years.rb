class CreateStudyYears < ActiveRecord::Migration
  def change
    create_table :study_years do |t|
      t.integer :year
      t.string :name

      t.timestamps null: false
    end
  end
end
