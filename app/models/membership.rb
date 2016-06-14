class Membership < ActiveRecord::Base

  has_and_belongs_to_many :subscriptions
  has_and_belongs_to_many :excluded_memberships, class_name: 'Membership', join_table: 'memberships_exclusions', association_foreign_key: 'excluded_membership_id'

  validates_presence_of :name, :price
  validates_inclusion_of :price, in: 0..1000

end
