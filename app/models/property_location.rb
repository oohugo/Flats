# coding: utf-8
class PropertyLocation < ApplicationRecord
  validates :name, presence: { message: 'Nome deve estar preenchido' }
  validates :name, uniqueness: { message: 'A região deve ser única' }
end
