class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #
  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD = /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d!@#\$%\^\&*\)\(+=._-]{6,128}\z/i
  VALID_KATAKANA = /\A[\p{katakana}\p{blank}ー－]+\z/
  VALID_PHONENUMBER = /\A\d{10}$|^\d{11}\z/
  #user
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL, message: 'error'}
  validates :password, presence: true, length: { in: 6..128 }, format: { with: VALID_PASSWORD, message: 'は英字と数字両方を含むパスワード6文字以上で設定してください'}
  validates :last_name, presence: true
  validates :fast_name, presence: true
  validates :last_name_kana, presence: true, format: { with: VALID_KATAKANA, message: 'はカタカナで入力して下さい'}
  validates :fast_name_kana, presence: true, format: { with: VALID_KATAKANA, message: 'はカタカナで入力して下さい'}
  validates :nickname, presence: true, length: { maximum: 20 }
  validates :phone_number, presence: true, format: { with: VALID_PHONENUMBER, message: 'の入力が正しくありません'}
end