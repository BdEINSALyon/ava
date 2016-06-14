class StudyYear < ActiveRecord::Base

  validates_presence_of :name, :year
  validates_length_of :name, minimum: 1, maximum: 64
  validates_inclusion_of :year, in: 0..12

end
