class Comment < ActiveRecord::Base
  belongs_to :combo, :foreign_key => "combo_id"
end
