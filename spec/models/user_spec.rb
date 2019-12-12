require 'rails_helper'

describe User do
  describe '#create' do
#空では登録できない
    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without a encrypted_password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "is invalid without a last_name" do
      user = build(:user, last_name: "")
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    it "is invalid without a fast_name" do
      user = build(:user, fast_name: "")
      user.valid?
      expect(user.errors[:fast_name]).to include("can't be blank")
    end

    it "is invalid without a last_name_kana" do
      user = build(:user, last_name_kana: "")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("can't be blank")
    end

    it "is invalid without a fast_name_kana" do
      user = build(:user, fast_name_kana: "")
      user.valid?
      expect(user.errors[:fast_name_kana]).to include("can't be blank")
    end

    it "is invalid without a birth_year" do
      user = build(:user, birth_year: "")
      user.valid?
      expect(user.errors[:birth_year])
    end

    it "is invalid without a birth_month" do
      user = build(:user, birth_month: "")
      user.valid?
      expect(user.errors[:birth_month])
    end

    it "is invalid without a birth_day" do
      user = build(:user, birth_day: "")
      user.valid?
      expect(user.errors[:birth_day])
    end

    it "is invalid without a nickname" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

#パスワード6〜128で登録できるか
    it "is invalid with a password that has less than 5 characters " do
      user = build(:user, password: "1234a")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end

    it "is valid with a password that has more than 6 characters " do
      user = build(:user, password: "12345a")
      user.valid?
      expect(user).to be_valid
    end
    
    it "is valid with a password that has more than 128 characters " do
      user = build(:user, password: "abcdefgh123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890")
      user.valid?
      expect(user).to be_valid
    end

    it "is valid with a password that has more than 129 characters " do
      user = build(:user, password: "abcdefghi123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890")
      user.valid?
      expect(user.errors[:password]).to include("is too long (maximum is 128 characters)")
    end
#passwordが英数字が含まれているか
    it "is valid with a password that Contains letters and numbers " do
      user = build(:user, password: "123456a", password_confirmation: "123456a")
      user.valid?
      expect(user).to be_valid
    end

    it "is invalid with a password except for numbers" do
      user = build(:user, password: "1234567", password_confirmation: "1234567")
      user.valid?
      expect(user.errors[:password][0]).to include("")
    end

    it "is invalid with a password except for alphabets" do
      user = build(:user, password: "aaaaaaa", password_confirmation: "aaaaaaa")
      user.valid?
      expect(user.errors[:password][0]).to include("")
    end
#passwordが一致しているか
    it "is valid with a password and password confirmation match " do
      user = build(:user, password: "123456a", password_confirmation: "123456a")
      user.valid?
      expect(user).to be_valid
    end

    it "is valid with a password and password confirmation match " do
      user = build(:user, password: "123456a", password_confirmation: "g64g64")
      user.valid?
      expect(user.errors[:password_confirmation][0]).to include("doesn't match Password")
    end
#passwordに記号が含まれても問題ないか
    it "is valid with a password that Contains letters and numbers and symbol " do
      user = build(:user, password: "a123!@#$%^&*)(=_-", password_confirmation: "a123!@#$%^&*)(=_-")
      user.valid?
      expect(user).to be_valid
    end
#カタカナで入力できるか
    it "is valid with a last_name_kana that katakana " do
      user = build(:user, last_name_kana: "ア")
      user.valid?
      expect(user).to be_valid
    end

    it "is invalid with a last_name_kana that katakana " do
      user = build(:user, last_name_kana: "あ")
      user.valid?
      expect(user.errors[:last_name_kana][0]).to include("")
    end

    it "is valid with a fast_name_kana that katakana " do
      user = build(:user, fast_name_kana: "ア")
      user.valid?
      expect(user).to be_valid
    end

    it "is invalid with a fast_name_kana that katakana " do
      user = build(:user, fast_name_kana: "あ")
      user.valid?
      expect(user.errors[:fast_name_kana][0]).to include("")
    end
#nicknameが２０文字以下か
    # 20文字
    it "is valid with a nickname that has less than 20 characters " do
      user = build(:user, nickname: "aaaaaaaaaaaaaaaaaaaa") 
      expect(user).to be_valid
    end
    # 21文字
    it "is invalid with a nickname that has more than 20 characters" do
      user = build(:user, nickname: "aaaaaaaaaaaaaaaaaaaaa") 
      user.valid?
      expect(user.errors[:nickname]).to include("is too long (maximum is 20 characters)")
    end

  end
end