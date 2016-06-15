class Subscription < ActiveRecord::Base

  belongs_to :member
  belongs_to :membership

  accepts_nested_attributes_for :membership

  validates :method, presence: true, inclusion: %w(EMV ESP CHQ)
  validates_presence_of :member

end
