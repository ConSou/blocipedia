require 'rails_helper'

RSpec.describe WikisController, type: :controller do
  let(:user) {User.create!(email: "bloccer@bloc.io", password: "password")}
  let(:my_wiki) {Wiki.create!(title: "Test Post", body: "Test Body", user: user)}

  before do
    user.confirm
    sign_in user
  end

  describe "GET #index" do

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do

    it "returns http success" do

      get :show, params: {id: my_wiki.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the show view" do

      get :show, params: {id: my_wiki.id}
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do

    it "returns http success" do

      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do

    it "it assigns new wiki to @wiki" do

      post :create, params: {id: my_wiki.id, wiki: {title: "another one title", body: "another one body"}}
      expect(assigns(:wiki)).to eq Wiki.last
    end

    it "redirects to wiki" do

      post :create, params: {id: my_wiki.id, wiki: {title: "another one title", body: "another one body"}}
      expect(response).to redirect_to Wiki.last
    end
  end

  describe "PUT #update" do

    it "updates wiki" do

      new_title = "new title"
      new_body = "new body"

      put :update, params: {id: my_wiki.id, wiki: {title: new_title, body: new_body}}

      updated_wiki = assigns(:wiki)
      expect(updated_wiki.id).to eq my_wiki.id
      expect(updated_wiki.title).to eq new_title
      expect(updated_wiki.body).to eq new_body
    end

    it "redirects to updated wiki" do

      new_title = "new title"
      new_body = "new body"

      put :update, params: {id: my_wiki.id, wiki: {title: new_title, body: new_body}}
      expect(response).to redirect_to my_wiki
    end
  end

  describe "GET #edit" do

    it "returns http success" do
      get :edit, params: {id: my_wiki.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do

      get :edit, params: { id: my_wiki.id }
      expect(response).to render_template :edit
    end
  end

  describe "DELETE destroy" do

    it "deletes wiki" do

      delete :destroy, params: {id: my_wiki.id}
      count = Wiki.where({id: my_wiki.id}).size
      expect(count).to eq(0)
    end
  end
end
