class Region < ApplicationRecord
  self.primary_key = 'region_code'
  has_many :deputies
  has_many :deeds , through: :deputies
end
