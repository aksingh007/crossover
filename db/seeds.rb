# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'yaml/store'
require 'active_record/fixtures'

# Initialize settings
puts "Initializing Settings"
["roles"].each do |fixture_type|
  puts "Initializing #{fixture_type}"
  ActiveRecord::Fixtures.create_fixtures("#{Rails.root}/db/fixtures/", fixture_type)
end