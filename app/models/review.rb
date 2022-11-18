class Review < ApplicationRecord
  belongs_to :list
  validates :comment, :rating, presence: true
  def blank_stars
    5 - rating.to_i
  end
end
