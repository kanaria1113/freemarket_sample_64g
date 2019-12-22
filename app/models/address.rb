class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  delegate :name, to: :prefecture

  belongs_to :user, optional: true
  VALID_PHONENUMBER = /\A\d{10}$|^\d{11}\z/
end
