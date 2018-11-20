class Region < ApplicationRecord
  has_many :deputies
  has_many :deeds, through: :deputies
end
