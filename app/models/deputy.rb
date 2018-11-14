class Deputy < ApplicationRecord
  has_many :deeds
  def full_name
    "#{name} #{surname} #{patronymic}"
  end
end
