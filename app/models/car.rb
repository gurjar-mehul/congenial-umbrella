class Car < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  validates :name, presence: true
  validates :name, uniqueness: true, allow_blank: true
end
