class Artist < ActiveRecord::Base

  has_many :lineups
  has_many :events, through: :lineup

  validates :name, presence: true

end
