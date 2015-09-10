namespace :db do
  desc "Fill database with db data"

  task initialize: :environment do
    make_admin
  end

  task populate: :environment do
    make_users
  end
end

def make_admin
  User.create(
      name: 'henryhyn',
      email: 'henryhyn@163.com',
      password: '12345678',
      password_confirmation: '12345678'
  )
end

def make_users
  9.times do |n|
    name = Faker::Internet.user_name
    email = Faker::Internet.email
    password = Faker::Internet.password
    User.create(
        name: name,
        email: email,
        password: password,
        password_confirmation: password
    )
  end
end
