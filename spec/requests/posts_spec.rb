require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/posts", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Post. As you add validations to Post, be sure to
  # adjust the attributes here as well.

  let(:valid_attributes) {
    {
      headline: 'Post 1',
      content: 'Post 1 content',
      topic_id: Topic.first.id,
    }
  }

  let(:invalid_attributes) {
    {
      headline: nil,
      content: 'Post 1 content',
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Post.create! valid_attributes
      get topic_posts_url(valid_attributes[:topic_id])
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      post = Post.create! valid_attributes
      get topic_post_url(valid_attributes[:topic_id], post)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_topic_post_url(valid_attributes[:topic_id])
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      post = Post.create! valid_attributes
      get edit_topic_post_url(valid_attributes[:topic_id], post)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Post" do
        expect {
          post topic_posts_url(valid_attributes[:topic_id]), params: { post: valid_attributes }
        }.to change(Post, :count).by(1)
      end

      it "redirects to the created post" do
        post topic_posts_url(valid_attributes[:topic_id]), params: { post: valid_attributes }
        expect(response).to redirect_to(topic_post_url(valid_attributes[:topic_id], Post.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Post" do
        expect {
          post topic_posts_url(valid_attributes[:topic_id]), params: { post: invalid_attributes }
        }.to change(Post, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post topic_posts_url(valid_attributes[:topic_id]), params: { post: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { headline: 'changed',
          content: 'Post 1 content',
          topic_id: 1, }
      }

      it "updates the requested post" do
        post = Post.create! valid_attributes
        patch topic_post_url(valid_attributes[:topic_id], post), params: { post: new_attributes }
        post.reload
        expect(post.headline).to eq(new_attributes[:headline])
      end

      it "redirects to the post" do
        post = Post.create! valid_attributes
        patch topic_post_url(valid_attributes[:topic_id], post), params: { post: new_attributes }
        post.reload
        expect(response).to redirect_to(topic_post_url(valid_attributes[:topic_id], post))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        post = Post.create! valid_attributes
        patch topic_post_url(valid_attributes[:topic_id], post), params: { post: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested post" do
      post = Post.create! valid_attributes
      expect {
        delete topic_post_url(valid_attributes[:topic_id], post)
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the posts list" do
      post = Post.create! valid_attributes
      delete topic_post_url(valid_attributes[:topic_id], post)
      expect(response).to redirect_to(topic_posts_url(valid_attributes[:topic_id]))
    end
  end
end
