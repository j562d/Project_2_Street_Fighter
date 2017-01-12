class User < ActiveRecord::Base

  has_many :combos, dependent: :destroy




  has_secure_password

  validates :email, presence: true, uniqueness: true




end
