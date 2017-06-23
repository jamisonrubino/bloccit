# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
 require 'random_data'

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
     topic:  topics.sample,
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 posts = Post.all
 
 # Create Sponsored Posts
 20.times do
  SponsoredPost.create!(
     topic:  topics.sample,
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 sponsored_posts = SponsoredPost.all
 
 # Create Comments
 100.times do
   Comment.create!(
     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end
 
  80.times do
   Comment.create!(
     post: sponsored_posts.sample,
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
 
 puts "Seed finished"
 puts "#{SponsoredPost.count} sponsored posts created"
 puts "#{Topic.count} topics created"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
 puts "#{Advertisement.count} advertisements created"
 puts "#{Question.count} questions created"