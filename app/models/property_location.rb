class PropertyLocation < ApplicationRecord
  has_many :properties
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
