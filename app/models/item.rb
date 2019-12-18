class Item < ApplicationRecord
  belongs_to :seler, class_name: "User"
  belongs_to :buyer, class_name: "User"
  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :price, presence: true, inclusion: 300..9999999
end