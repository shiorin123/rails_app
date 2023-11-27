class Like < ApplicationRecord
  belongs_to :good
  belongs_to :user

  validates_uniqueness_of :good_id, scope: :user_id

end
