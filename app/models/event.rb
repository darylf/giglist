class Event < ActiveRecord::Base

  has_many :lineups
  has_many :artists, through: :lineups

  belongs_to :tour
  belongs_to :venue

  validates :start_date, presence: true
  validates :venue, presence: true

end
