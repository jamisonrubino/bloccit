# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
 require 'random_data'


 # Create an admin user

 admin = User.create!(
   name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
   role:     'admin'
 )
 
 # Create a member
 member = User.create!(
   name:     'Member User',
   email:    'member@example.com',
   password: 'helloworld'
 )
 users = User.all

 # Create Topics
 15.times do
   Topic.create!(
     name:         RandomData.random_sentence,
     description:  RandomData.random_paragraph
   )
 end
 topics = Topic.all


 # Create Posts
 50.times do
 # #1
   Post.create!(
 # #2
     user:   users.sample,
     topic:  topics.sample,
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 posts = Post.all
 
 # Create Sponsored Posts
 10.times do
  SponsoredPost.create!(
   topic:  topics.sample,
   title:  RandomData.random_sentence,
   body:   RandomData.random_paragraph,
   price:  6
  )
 end
 sponsored_posts = SponsoredPost.all
 
 # Create Comments
 # #3
 100.times do
   Comment.create!(
 # #4
     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end
 
  100.times do
   Comment.create!(
 # #4
     sponsored_post: sponsored_posts.sample,
     body: RandomData.random_paragraph
   )
 end
 
 puts "#{Post.count}"
 Post.find_or_create_by!(title: "A new post title!", body: "A new post body!!!!")
 puts "#{Post.count}"
 
 
 10.times do
  Advertisement.create!(
   title: RandomData.random_sentence,
   body: RandomData.random_paragraph,
   price: 6
  )
 end
 
 100.times do
  Question.create!(
   title: RandomData.random_sentence,
   body: RandomData.random_paragraph,
   resolved: false
  )
 end
 
 user = User.first
   user.update_attributes!(
   email: 'jamison.rubino@gmail.com', # replace this with your personal email
   password: 'helloworld'
 )
 
 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Topic.count} topics created"
 puts "#{Post.count} posts created"
 puts "#{SponsoredPost.count} sponsored posts created"
 puts "#{Comment.count} comments created"
 puts "#{Advertisement.count} advertisements created"
 puts "#{Question.count} questions created"