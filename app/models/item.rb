class Item < ApplicationRecord
  validates :name, presence: true

  belongs_to :category
  has_many :sold_items

  has_many :item_sizes
  has_many :sizes, through: :item_sizes, dependent: :destroy
  accepts_nested_attributes_for :item_sizes

  self.per_page = 2
end
