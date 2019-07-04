# User.create!(name: "Hung Ngo", email: "ngotaihung@gmail.com",
#   is_admin: true, avatar: "https://via.placeholder.com/80x100")

# 20.times do |n|
#   name  = Faker::Name.name
#   email = "example-#{n+1}@railstutorial.org"
#   User.create!(name: name, email: email,
#   avatar: "https://via.placeholder.com/80x100")
# end

# # Users - activities
# users = User.all
# users.each do |user|
#   status = Faker::Lorem.sentence(5)
#   act_type = [0, 1].sample
#   user.activities.create!(status: status, act_type: act_type )
# end

# Following relationships
users = User.all
user  = users.first
following = users[2..20]
followers = users[10..20]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

# Courses
10.times do |n|
  name  = Faker::Name.unique.name
  image = "https://via.placeholder.com/120x150"
  description = Faker::Lorem.sentence(10)
  duration = 20
  question_num = 20
  Course.create!(name: name, image: image, description: description,
    duration: duration, question_num: question_num)
end

50.times do |n|
  course_id = (1..10).to_a.sample
  user_id = (1..21).to_a.sample
  Lesson.create!(course_id: course_id, user_id: user_id)
end

courses = Course.all
courses.each do |course|
  10.times do |n|
    name = Faker::Educator.subject
    meaning = Faker::Lorem.sentence(10)
    speech= Faker::Lorem.sentence(10)
    example = Faker::Lorem.sentence(10)
    course.words.create!(name: name, meaning: meaning, speech: speech,
      example: example)
  end
end
