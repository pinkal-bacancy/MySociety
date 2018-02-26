# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ROLES=["super_admin","admin","member"]
ROLES.each do |role|
	Role.find_or_create_by(name: role)
end
admin_society=Society.find_or_create_by(society_name:"admin society")
admin= User.find_by(email:"pinkaldarji92@gmail.com")

unless admin.present?
	admin = User.create(name:"Ad",email:"pinkaldarji92@gmail.com",dob:"20/12/1996",gender:"male",contact_no:"1234567890",society_id:admin_society.id)
	admin.password =  "pdd0421"
	admin.save
	admin.add_role "super_admin"
end

puts admin.errors.full_messages