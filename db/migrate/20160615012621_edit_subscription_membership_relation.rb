class EditSubscriptionMembershipRelation < ActiveRecord::Migration
  def change
    add_reference :subscriptions, :membership
    drop_join_table :subscriptions, :memberships
  end
end
