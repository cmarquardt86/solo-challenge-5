require 'faker'


User.create :name => 'Dev Bootcamp Student', :email => 'me@example.com', :password => 'password', :access_level => 'admin'
5.times do
  User.create :name => Faker::Name.name, :email => Faker::Internet.email, :password => 'password', :access_level => 'student'
end
