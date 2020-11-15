class Lecture < ApplicationRecord
  belongs_to :item, optional: true
  has_many :lecture_terms

  validates :name, presence: true, length: { maximum: 50 }
  validates :teacher, length: { maximum: 20 }
  validates :explanation, length: { maximum: 1000 }
end
