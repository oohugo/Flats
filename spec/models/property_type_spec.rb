# coding: utf-8
require 'rails_helper'

RSpec.describe PropertyType, type: :model do
   describe Property do
    context 'validations' do
      context 'present' do
        it 'name must be present' do
          property_type = PropertyType.new
          property_type.valid?
          expect(property_type.errors.full_messages_for(:name)).to include('Nome não pode ficar em branco')
        end
      end
    end
  end
end
