class Subscription < ActiveRecord::Base

  belongs_to :member

  validates :method, presence: true, inclusion: %w(EMV ESP CHQ)
  validates_presence_of :member

end
