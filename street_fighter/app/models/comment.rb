class Comment < ActiveRecord::Base
  belongs_to :combo, :foreign_key => "combo_id"
  belongs_to :user, :foreign_key => "user_id"
end
