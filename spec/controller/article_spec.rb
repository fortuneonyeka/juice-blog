require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  let(:valid_attributes) {
    { title: "Test title", content: "Test content" }
  }

  let(:invalid_attributes) {
    { title: "", content: "" }
  }

  describe "GET #index" do
    it "returns a success response" do
      Article.create! valid_attributes
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      article = Article.create! valid_attributes
      get :show, params: { id: article.to_param }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Article" do
        expect {
          post :create, params: { article: valid_attributes }
        }.to change(Article, :count).by(1)
      end

      it "redirects to the created article" do
        post :create, params: { article: valid_attributes }
        expect(response).to redirect_to(Article.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { article: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end
end