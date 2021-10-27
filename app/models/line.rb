class Line < ApplicationRecord
  belongs_to :order
  has_one :prescription
end
