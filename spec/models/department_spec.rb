require 'rails_helper'

RSpec.describe Department, type: :model do
  it 'creates a simple TC departement' do
    d = Department.new name: 'TC'
    expect(d.valid?).to be_truthy
    before_add = Department.where(name: 'TC').count
    d.save!
    Department.find_by name: 'TC'
    expect(Department.where(name: 'TC').count).to be > before_add
    d.delete
  end
  it 'considers no named department as invalid' do
    d = Department.new
    expect(d.valid?).to be_falsey
  end
end
