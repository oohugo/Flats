# coding: utf-8
class PropertyType < ApplicationRecord
  has_many :properties
  validates :name, presence: { message: 'Nome deve estar preenchido' }
  validates :name, uniqueness: { case_sensitive: false, message: 'Nome deve ser único' }
end
