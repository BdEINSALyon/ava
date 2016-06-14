# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# WARNING: This seed file was designed for BdE INSA Lyon, and can not be suitable for your Union

user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

(1...5).each do |year|
  StudyYear.find_or_create_by! year: year, name: "#{year}A"
end
StudyYear.find_or_create_by! year: 6, name: 'Doctorat'
StudyYear.find_or_create_by! year: 10, name: 'Autre'

puts 'Created Study Years'

%w(BB BIM GCU GE GEN GI GM IF SGM TC).each do |dep|
  Department.find_or_create_by! name: dep
end

puts 'Created Departments'

[
    {code:'A',price:95},
    {code:'B',price:20},
    {code:'K',price:17},
].each do |mode|
  Membership.find_or_create_by! name:"VA#{DateTime.now.year}#{mode[:code]}", price: mode[:price] do |t|
    t.active = true
  end
end

Membership.all.each do |m|
  m.excluded_memberships << Membership.all
  m.excluded_memberships.delete m
  m.save
end

puts 'Created Memberships'