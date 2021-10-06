# coding: utf-8
class PropertyType < ApplicationRecord
  has_many :properties
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
