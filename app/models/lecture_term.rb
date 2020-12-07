class LectureTerm < ApplicationRecord
  has_many :lectures
  belongs_to :item
end
