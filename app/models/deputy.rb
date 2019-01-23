class Deputy < ApplicationRecord
  has_many :deeds, dependent: :delete_all
  has_many :regions, through: :deeds
  has_attached_file :image, styles: {medium: "300x300>", thumb: "100x100>"}
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def full_name
    "#{name} #{surname} #{patronymic}"
  end

  def sum_of_detriment
    sum = 0
    deeds.each do |value|
      sum += value.detriment
    end
    sum
  end

  def rating
    Deputy.all.sort {|y, x| x.deeds.count <=> y.deeds.count}.index(self) + 1
  end
end
