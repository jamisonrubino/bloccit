require 'rails_helper'

RSpec.describe AdvertisementsControllerController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "GET #edit" do
   it "returns http success" do
     get :edit, {id: my_post.id}
     expect(response).to have_http_status(:success)
   end
 
   it "renders the #edit view" do
     get :edit, {id: my_post.id}
 # #1
     expect(response).to render_template :edit
   end
 
 # #2
   it "assigns post to be updated to @post" do
     get :edit, {id: my_post.id}
 
     post_instance = assigns(:post)
 
     expect(post_instance.id).to eq my_post.id
     expect(post_instance.title).to eq my_post.title
     expect(post_instance.body).to eq my_post.body
    end
  end

end
