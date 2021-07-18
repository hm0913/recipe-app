require 'rails_helper'

describe User do
  describe '#create' do
    it "nameが空だと登録できない" do
      user = build(:user, name: "")
      expect(user).to_not be_valid
    end

    it "emailが空だと登録できない" do
      user = build(:user, email: "")
      expect(user).to_not be_valid
    end

    it "passwordが空だと登録できない" do
      user = build(:user, password: "")
      expect(user).to_not be_valid
    end

    it "passwordが5文字以下だと登録できない" do
      user = build(:user, password: "a" * 5)
      expect(user).to_not be_valid
    end

    context "nameが15文字以下の場合" do
      it "登録できる" do
        user = build(:user, name: "a" * 15)
        expect(user).to be_valid
      end
    end

    context "nameが16文字以上の場合" do
      it "登録できない" do
        user = build(:user, name: "a" * 16)
        expect(user).to_not be_valid
      end
    end
  end
end