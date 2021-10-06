# coding: utf-8
require 'rails_helper'

RSpec.describe PropertyLocation, type: :model do
  describe Property do
    context 'validations' do
      context 'present' do
        it 'name must be present' do
          property_location = PropertyLocation.new
          property_location.valid?
          expect(property_location.errors.full_messages_for(:name)).to include('Name não pode ficar em branco')
        end
      end
    end
  end
end
