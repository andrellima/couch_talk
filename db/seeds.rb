require 'faker'

10.times do 
  User.create(
  :login => Faker::Name.name,
  :password => "forever",
  :password => "forever",
  :email => Faker::Internet.email,
  :created_at => DateTime.now
  )
end


20.times do 
  Post.create(
    :title => Faker::Lorem.paragraph,
    :body => Faker::Lorem.paragraphs(5),
    :user  => User.first,
    :created_at => DateTime.now
    )
end