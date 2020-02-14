require 'rails_helper'

RSpec.describe 'User',type: :model do
  describe '#create' do
    it "ニックネームなしの登録" do
      user = build(:user, nickname: nil)   
        user.valid?
         expect(user.errors[:nickname]).to include("を入力してください")
    end
    it "emailなしの登録" do
      user = build(:user, email: nil)
         user.valid?
         expect(user.errors[:email]).to include("を入力してください")
    end
    it "パスワードなしの登録" do
      user = build(:user, password: nil)
         user.valid?
         expect(user.errors[:password]).to include("を入力してください")
    end
    it "名前なしの登録" do
      user = build(:user, firstname: nil)
         user.valid?
         expect(user.errors[:firstname]).to include("を入力してください")
    end
    it "苗字なしの登録" do
      user = build(:user, lastname: nil)
         user.valid?
         expect(user.errors[:lastname]).to include("を入力してください")
    end
    it "名前ふりがななしの登録" do
      user = build(:user, firstname_kana: nil)
         user.valid?
         expect(user.errors[:firstname_kana]).to include("を入力してください")
    end
    it "苗字ふりがな無しの登録" do
      user = build(:user, lastname_kana: nil)
         user.valid?
         expect(user.errors[:lastname_kana]).to include("を入力してください")
    end
    it "誕生日無しの登録" do
      user = build(:user, birthdate: nil)
         user.valid?
         expect(user.errors[:birthdate]).to include("を入力してください")
    end

    it "全項目有りの登録" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "重複したアドレスは登録不可能" do
      user = create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "ニックネームが21文字以上だと登録不可能 " do
      user = build(:user, nickname: "abcdefghijklmnopqrstu")
      user.valid?
      expect(user.errors[:nickname]).to include("は20文字以内で入力してください")
    end

    it "ニックネームが20文字以内だと登録可能" do
      user = build(:user, nickname: "abcdefghijklmnopqrst")
      user.valid?
      expect(user).to be_valid
    end

    it "passwordが7文字以上128文字以内だと登録可能（7文字）" do
      user = build(:user, password: "aaaaaaa")
      user.valid?
      expect(user).to be_valid
    end

    it "passwordが7文字以上128文字以内だと登録可能（128文字）" do
      user = build(:user, password: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      user.valid?
      expect(user).to be_valid
    end

    it "passwordが6文字以内だと登録不可能" do
      user = build(:user, password: "aaaaaa")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end

    it "passwordが129文字以上だと登録不可能（129文字）" do
      user = build(:user, password: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      user.valid?
      expect(user.errors[:password]).to include("は128文字以内で入力してください")
    end
  end
end