class SoldItem < ApplicationRecord
  belongs_to :invoice
  belongs_to :item
  belongs_to :size
end
  