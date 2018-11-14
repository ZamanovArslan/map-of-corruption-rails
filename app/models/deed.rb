class Deed < ApplicationRecord
  belongs_to :deputy
  belongs_to :region
end
