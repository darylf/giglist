class Event < ActiveRecord::Base

  has_many :lineups, -> { order('sort_order, name asc') }
  has_many :artists, through: :lineups

  belongs_to :tour
  belongs_to :venue

  validates :start_date, presence: true
  validates :venue, presence: true

  def display_name
    if name.nil?
      "#{start_date} - #{venue.name}"
    else
      "#{start_date} - #{name}"
    end
  end
end
