require 'rails_helper'

RSpec.describe StudyYear, type: :model do
  it 'fails validation with no name and no year' do
    s = StudyYear.new
    expect(s.valid?).to be_falsey
  end
  it 'validates year 1A with value 1' do
    s = StudyYear.new name: '1A', year: 1
    expect(s.valid?).to be_truthy
  end
  it 'validates generated year by FactoryGirl' do
    s = create(:study_year)
    expect(s.valid?).to be_truthy
  end
end
