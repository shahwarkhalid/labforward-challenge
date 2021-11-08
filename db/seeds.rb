# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

emails = [
  "itisshahwar@gmail.com",
  "nkdev@mailinator.com",
  "abc@oxford.edu.eng",
  "xyz@melbourne.edu.aus",
  "cdf@northeastren.edu.ma",
  "jkl@mailinator.com",
]

emails.each do |email|
  user = User.where(email: email).first_or_initialize
  user.password = 'password'

  user.save(validate: false)
end

puts "Sign in as: \n Email: itisshahwar@gmail.com \n Password: password"
