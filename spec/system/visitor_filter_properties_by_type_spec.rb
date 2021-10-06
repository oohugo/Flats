# coding: utf-8
require 'rails_helper'

describe 'Visitor filter properties by type' do
  it 'should view links in a nav bar' do
    PropertyType.create!(name: 'Apartamento')
    PropertyType.create!(name: 'Casa')
    PropertyType.create!(name: 'Sítio')

    visit root_path

    expect(page).to have_link('Apartamento')
    expect(page).to have_link('Casa')
    expect(page).to have_link('Sítio')
  end

  it 'successfully' do
    casa = PropertyType.create!(name: 'Casa')
    sitio = PropertyType.create!(name: 'Sítio')
    Property.create!({ title: 'Casa com quintal em Copacabana', bathrooms: 2, daily_rate: 500,
                       description: 'Excelente casa, recem formada com 2 vagas de caragem',
                       rooms: 3, property_type: casa, property_location: PropertyLocation.new(name: 'Rio de Janeiro'),
                       property_owner: PropertyOwner.create!(email: 'joao@email.com', password: '123456') })
    Property.create!({ title: 'Coberura em Manaus', bathrooms: 1, daily_rate: 5000,
                       description: 'Cobertura de 300m2, churrascaria',
                       rooms: 5, property_type: sitio, property_location: PropertyLocation.new(name: 'Manaus'),
                       property_owner: PropertyOwner.create!(email: 'joao@emaiol.com', password: '123456') })

    visit root_path
    click_on 'Casa'

    expect(page).to have_css('h1', text: 'Imóveis do tipo Casa')
    expect(page).to have_content('Casa com quintal em Copacabana')
    expect(page).not_to have_content('Cobertura em Manaus')
  end
end
