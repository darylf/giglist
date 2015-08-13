class Artist < ActiveRecord::Base

  has_many :lineups
  has_many :events, through: :lineups

  validates :name, presence: true

end
