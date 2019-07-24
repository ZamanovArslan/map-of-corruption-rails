class Admin < ApplicationRecord
  has_many :deeds, dependent: :destroy
  has_many :deputies, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable
  def login
    email.split("@")[0]
  end
end
