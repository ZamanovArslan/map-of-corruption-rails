class Deputy < ApplicationRecord
  has_many :deeds, dependent: :delete_all
  has_many :regions, through: :deeds
  def full_name
    "#{name} #{surname} #{patronymic}"
  end
end
