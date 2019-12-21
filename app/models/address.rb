class Address < ApplicationRecord

  
  belongs_to :user, optional: true
  VALID_PHONENUMBER = /\A\d{10}$|^\d{11}\z/
  delegate :name, to: :prefectures


end
