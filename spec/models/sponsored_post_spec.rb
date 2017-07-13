require 'rails_helper'

RSpec.describe SponsoredPost, type: :model do

   let(:name) { RandomData.random_sentence }
   let(:description) { RandomData.random_paragraph }
   let(:title) { RandomData.random_sentence }

   it { is_expected.to have_many(:comments) }
   it { is_expected.to have_many(:votes) }

   let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }
   let(:post) { topic.sponsored_posts.create!(title: title, body: body, user: user) }

   it { is_expected.to belong_to(:topic) }
   it { is_expected.to belong_to(:user) }

   let(:topic) { Topic.create!(name: name, description: description) }
 # #4
   let(:post) { topic.sponsored_posts.create!(title: title, body: body) }
 
   it { is_expected.to belong_to(:topic) }


   it { is_expected.to validate_presence_of(:title) }
   it { is_expected.to validate_presence_of(:body) }
   it { is_expected.to validate_presence_of(:topic) }
   it { is_expected.to validate_presence_of(:user) }

 
   it { is_expected.to validate_length_of(:title).is_at_least(5) }
   it { is_expected.to validate_length_of(:body).is_at_least(20) }

 # #2
    describe "attributes" do
        it "has a title, body, and user attribute" do
            expect(post).to have_attributes(title: title, body: body, user: user)
        end
    end
    
end
