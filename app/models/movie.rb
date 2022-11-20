class Movie < ApplicationRecord
  has_many :bookmarks
  validates :title, uniqueness: true
  validates :title, :overview, presence: true
  # acts_as_list
end
