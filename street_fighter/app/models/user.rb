class User < ActiveRecord::Base

  has_many :combos, dependent: :destroy

  has_many :favorites
  has_many :favorite_combos, through: :favorites, source: :combo


  has_secure_password

  validates :email, presence: true, uniqueness: true




end
