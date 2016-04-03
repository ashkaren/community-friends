# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all

user = User.create!(
	:name => 'Admin', 
	:email => 'admin@valdosta.edu', 
	:password => 'password', 
	:password_confirmation => 'password',
	:address => '1500 N Patterson St, Valdosta, GA',
	:sex => 'Male',
	:role => 'Admin'
)

user = User.create!(
	:name => 'Jason Castillo', 
	:email => 'jhcastillo@valdosta.edu', 
	:password => 'password', 
	:password_confirmation => 'password',
	:address => '1500 N Patterson St, Valdosta, GA',
	:sex => 'Male'
)

user = User.create!(
	:name => 'Gena Evtodiev', 
	:email => 'gvevtodiev@valdosta.edu', 
	:password => 'password', 
	:password_confirmation => 'password',
	:address => '1500 N Patterson St, Valdosta, GA',
	:sex => 'Male'
)

user = User.create!(
	:name => 'Fifi Smith-Quayson', 
	:email => 'fsmithquayson@valdosta.edu', 
	:password => 'password', 
	:password_confirmation => 'password',
	:address => '1500 N Patterson St, Valdosta, GA',
	:sex => 'Male'
)
