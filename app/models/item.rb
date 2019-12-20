class Item < ApplicationRecord
  belongs_to :seler, class_name: "User", optional: true
  belongs_to :buyer, class_name: "User", optional: true
  has_many :images
  accepts_nested_attributes_for :images
  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :price, presence: true, inclusion: 300..9999999
end