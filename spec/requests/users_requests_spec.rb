require 'rails_helper'

describe UsersController do

  describe "Get#index" do
    it "リクエストが成功すること" do
      get users_url
      expect(response.status).to eq 200
    end

    it 'ユーザー名が表示されていること' do
      get users_url
      expect(response.body).to include
    end
  end

  describe "Get#show" do
    let(:bob) {create :bob}
    context "ユーザーがログインしてる場合" do
      it "リクエストが成功すること" do
        sign_in bob
        get users_url bob.id
        expect(response.status).to eq 200
      end

      it "要求されたユーザー名が表示されていること" do
        sign_in bob
        get user_url bob.id
        expect(response.body).to include "bob"
      end
    end

    context "ユーザーがログインしてない場合" do
      it "リダイレクトが成功すること" do
        get user_url bob.id
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "Post#create" do
    context "不備がない場合" do
      it "リクエストが成功すること" do
        post users_url params: {user: FactoryBot.attributes_for(:user)}
        expect(response.status).to eq 302
      end
      it "ユーザーが登録されること" do
        expect do
          post users_url, params: {user: FactoryBot.attributes_for(:user)}
        end.to change(User, :count).by(1)
      end
      
    end

    context "不備がある場合" do
      it "リダイレクトが成功すること" do
        post users_url params: {user: FactoryBot.attributes_for(:user, :invalid_user)}
        expect(response.status).to eq 200
      end
      it "ユーザーが登録されないこと" do
        expect do
          post users_url, params: {user: FactoryBot.attributes_for(:user, :invalid_user)}
        end.to_not change(User, :count)
      end
    end
  end

end