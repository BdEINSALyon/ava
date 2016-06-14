class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :member_id
      t.string :method

      t.timestamps null: false
    end
  end
end
