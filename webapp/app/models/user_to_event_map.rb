class UserToEventMap < ActiveRecord::Base
  validates :uid, presence: true
  validates :eid, presence: true

end
