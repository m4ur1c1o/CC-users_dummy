require 'faker'

User.create(name: "Mauricio", email: "mauricio@mail.com", password: "mau")

User.create(name: "Sandra", email: "sondi@mail.com", password: "sondi")

User.create(name: "Santiago", email: "santiago@mail.com", password: "santi")


for i in 0...12
	User.create(name: Faker::Name.first_name, email: Faker::Internet.email, password: Faker::Internet.password)
end