class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :movies, through: :bookmarks
  validates :name, presence: true
  validates :name, uniqueness: true
  has_one_attached :photo
  acts_as_list
  after_initialize :init
    def init
      self.position = self.id
    end
end
