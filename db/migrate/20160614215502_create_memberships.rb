class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.string :name
      t.string :description
      t.decimal :price
      t.boolean :active

      t.timestamps null: false
    end

    create_join_table :subscriptions, :memberships do |t|
      t.index :subscription_id
      t.index :membership_id
      t.index [:membership_id, :subscription_id], name: 'ms_index'
      t.index [:subscription_id, :membership_id], name: 'sm_index'
    end

    create_table :memberships_exclusions do |t|
      t.integer :membership_id
      t.integer :excluded_membership_id

      t.index :membership_id
      t.index :excluded_membership_id
    end
  end
end
