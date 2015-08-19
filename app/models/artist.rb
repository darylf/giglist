class Artist < ActiveRecord::Base

  has_many :lineups
  has_many :events, -> { order('start_date asc') }, through: :lineups

  validates :name, presence: true

end
