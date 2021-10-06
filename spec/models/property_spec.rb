# coding: utf-8
require 'rails_helper'

describe Property do
  context 'validations' do
    context 'present' do
      let(:property) { Property.new }
      it 'title must be present' do
        property.valid?
        expect(property.errors.full_messages_for(:title)).to include('Título não pode ficar em branco')
      end
      it 'description must be present' do
        property.valid?
        expect(property.errors.full_messages_for(:description)).to include('Descrição não pode ficar em branco')
      end
      it 'description must be present' do
        property.valid?
        expect(property.errors.full_messages_for(:rooms)).to include('Quartos não pode ficar em branco')
      end
      it 'bathrooms must be present' do
        property.valid?
        expect(property.errors.full_messages_for(:bathrooms)).to include('Banheiros não pode ficar em branco')
      end
      it 'daily_rate must be present' do
        property.valid?
        expect(property.errors.full_messages_for(:daily_rate)).to include('Diária não pode ficar em branco')
      end
      it 'property_type must be present' do
        property.valid?
        expect(property.errors.full_messages_for(:property_type)).to include('Tipo de propriedade é obrigatório(a)')
      end
    end
  end
end
