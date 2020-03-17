class ItemSize < ApplicationRecord
  belongs_to :item
  belongs_to :size
  accepts_nested_attributes_for :size

  validates :code, uniqueness: true

  def autosave_associated_records_for_size
    if new_size = Size.find_by_size_type(size.size_type)
      self.size = new_size
    else
      self.size.save!
    end
  end
end
 