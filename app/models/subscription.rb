class Subscription < ActiveRecord::Base

  belongs_to :member
  has_and_belongs_to_many :memberships

  validates :method, presence: true, inclusion: %w(EMV ESP CHQ)
  validates_presence_of :member

end
