class Customer < ApplicationRecord
	has_many :transactions
  validates :code, :name, :phone_number, :address, presence: true  
end
 