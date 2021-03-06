class Event < ApplicationRecord
  has_many :lineups, -> { order('sort_order, name asc') }
  has_many :artists, through: :lineups

  belongs_to :tour
  belongs_to :venue

  validates :start_date, presence: true
  validates :venue, presence: true

  def display_name
    if name.nil?
      "#{start_date} - #{venue_name}"
    else
      "#{name}"
    end
  end

  def venue_name
    venue.name
  end
end
