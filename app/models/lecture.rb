class Lecture < ApplicationRecord
  belongs_to :item, optional: true
  belongs_to :lecture_term, foreign_key: 'lecture_term_id', optional: true

  validates :name, presence: true, length: { maximum: 50 }
  validates :teacher, length: { maximum: 20 }
  validates :explanation, length: { maximum: 1000 }

  delegate :term, to: :lecture_term, prefix: true
end
