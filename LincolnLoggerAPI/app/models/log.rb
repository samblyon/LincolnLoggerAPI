class Log < ActiveRecord::Base
  validates :user, presence: true
  belongs_to :user
end
