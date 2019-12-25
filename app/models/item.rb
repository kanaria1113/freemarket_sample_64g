class Item < ApplicationRecord
  belongs_to :seler,optional: true, class_name: "User"
  belongs_to :buyer,optional: true, class_name: "User"
  has_many :categories, through: :items_categories
  has_many :images
  accepts_nested_attributes_for :images
  has_one :brand
  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :price, presence: true, inclusion: 300..9999999
end