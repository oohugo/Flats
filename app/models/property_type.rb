# coding: utf-8
class PropertyType < ApplicationRecord
  validates :name, presence: { message: 'Nome deve estar preenchido' }
  validates :name, uniqueness: { message: 'Nome deve ser único' }
end
