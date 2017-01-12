class Combo < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "500x500>", small: "250x250>", thumb: "100x100>" }, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  belongs_to :user, :foreign_key => "user_id"


end
