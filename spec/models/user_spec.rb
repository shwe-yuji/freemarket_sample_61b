require 'rails_helper'
describe User do
  describe '#create' do
    it "is invalid without a nickname" do
      user = build(:user, nickname: nil) 
        user.valid?
         expect(user.errors[:nickname]).to include("can't be blank")
    end
    # it "is invalid without an email" do
    #   user = user = build(:user, email: nil)
    #      user.valid?
    #      expect(user.errors[:email]).to include("can't be blank")
    # end
    # it "is invalid without a password" do
    #   user = user = build(:user, password: nil)
    #      user.valid?
    #      expect(user.errors[:password]).to include("can't be blank")
    # end
    # it "is invalid without a firstname" do
    #   user = user = build(:user, firstname: nil)
    #      user.valid?
    #      expect(user.errors[:firstname]).to include("can't be blank")
    # end
    # it "is invalid without a lastname" do
    #   user = user = build(:user, lastname: nil)
    #      user.valid?
    #      expect(user.errors[:lastname]).to include("can't be blank")
    # end
    # it "is invalid without a firstname_kana" do
    #   user = user = build(:user, firstname_kana: nil)
    #      user.valid?
    #      expect(user.errors[:firstname_kana]).to include("can't be blank")
    # end
    # it "is invalid without a lastname_kana" do
    #   user = user = build(:user, lastname_kana: nil)
    #      user.valid?
    #      expect(user.errors[:lastname_kana]).to include("can't be blank")
    # end
    # it "is invalid without a birthdate" do
    #   user = user = build(:user, birthdate: nil)
    #      user.valid?
    #      expect(user.errors[:birthdate]).to include("can't be blank")
    # end

    # it "is valid with a nickname, email, password,
    #                     firstname,lastname,firstname_kana,lastname_kana,birthdate" do
    #   user = build(:user)
    #   expect(user).to be_valid
    # end
    # it "重複したアドレスは登録不可能" do
    #    user = create(:user)
    #   another_user = build(:user)
    #   another_user.valid?
    #   expect(another_user.errors[:email]).to include("has already been taken")
    # end

    # it "ニックネームが21文字以上だと登録不可能 " do
    #   user = build(:user, nickname: "abcdefghijklmnopqrstu")
    #   user.valid?
    #   expect(user.errors[:nickname]).to include("is too long (maximum is 20 characters)")
    # end
    # it "ニックネームが20文字以内だと登録可能" do
    #   user = build(:user, nickname: "abcdefghijklmnopqrst")
    #   user.valid?
    #   expect(user).to be_valid
    # end
    # it "passwordが7文字以上128文字以内だと登録可能（7文字）" do
    #   user = build(:user, password: "aaaaaaa",password_confirmation: "aaaaaaa")
    #   user.valid?
    #   expect(user).to be_valid
    # end
    # it "passwordが7文字以上128文字以内だと登録可能（128文字）" do
    #   user = build(:user, password: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",password_confirmation: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
    #   user.valid?
    #   expect(user).to be_valid
    # end
    # it "passwordが6文字以内だと登録不可能" do
    #   user = build(:user, password: "aaaaaa",password_confirmation: "aaaaaa")
    #   user.valid?
    #   expect(user.errors[:password]).to include("is too short (minimum is 7 characters)")
    # end
    # it "passwordが129文字以上だと登録不可能（129文字）" do
    #   user = build(:user, password: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",password_confirmation: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
    #   user.valid?
    #   expect(user.errors[:password]).to include("is too long (maximum is 128 characters)")
    # end
  end
end