class Artist < ApplicationRecord
  has_many :lineups
  has_many :events, -> { order('start_date asc') }, through: :lineups
  validates :name, presence: true, uniqueness: true
end
