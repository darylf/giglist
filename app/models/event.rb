class Event < ActiveRecord::Base

  has_many :lineups
  has_many :artists, through: :lineup

  belongs_to :tour
  belongs_to :venue

  validates :start_date, presence: true
  validates :venue, presence: true

end
