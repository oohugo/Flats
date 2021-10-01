# coding: utf-8
require 'rails_helper'

describe 'Visitor filter properties by location' do
  it 'should view links in a nav bar' do
    PropertyLocation.create!(name: 'São Paulo')
    PropertyLocation.create!(name: 'Recife')
    PropertyLocation.create!(name: 'Rio de Janeiro')

    visit root_path

    expect(page).to have_link('São Paulo')
    expect(page).to have_link('Recife')
    expect(page).to have_link('Rio de Janeiro')
  end

  it 'successfully' do
    recife = PropertyLocation.create!(name: 'Recife')
    salvador = PropertyLocation.create!(name: 'Salvador')
    Property.create!({ title: 'Casa com quintal em Recife', bathrooms: 2, daily_rate: 500,
                       description: 'Excelente casa, recem formada com 2 vagas de caragem',
                       rooms: 3, property_type: PropertyType.create!(name: 'Casa'),
                       property_location: recife })
    Property.create!({ title: 'Coberura em Salvador', bathrooms: 1, daily_rate: 5000,
                       description: 'Cobertura de 300m2, churrascaria',
                       rooms: 5, property_type: PropertyType.create!(name: 'Sitio'),
                       property_location: salvador })

    visit root_path
    click_on 'Recife'

    expect(page).to have_css('h1', text: 'Imóveis da região Recife')
    expect(page).to have_content('Casa com quintal em Recife')
    expect(page).not_to have_content('Cobertura em Salvador')
  end
end
