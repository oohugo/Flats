# coding: utf-8
require 'rails_helper'

describe 'Visitor view Home' do
  it 'and view properties' do
    property_type = PropertyType.create!(name: 'Casa')
    property_location = PropertyLocation.create!(name: 'Brasil')
    Property.create!({ title: 'casa com quintal em Copacabana', bathrooms: 2, daily_rate: 500,
                       description: 'Excelente casa, recem formada com 2 vagas de caragem',
                       rooms: 3, property_type: property_type, property_location: property_location })

    Property.create!({ title: 'coberura em Manaus', bathrooms: 1, daily_rate: 5000,
                       description: 'Cobertura de 300m2, churrascaria',
                       rooms: 5, property_type: property_type, property_location: property_location })

    visit root_path
    expect(page).to have_content('casa com quintal em Copacabana')
    expect(page).to have_content('Excelente casa, recem formada com 2 vagas de caragem')
    expect(page).to have_content('Quartos: 3')
    expect(page).to have_content('coberura em Manaus')
    expect(page).to have_content('Cobertura de 300m2, churrascaria')
    expect(page).to have_content('Quartos: 5')
  end

  it 'and theres no property available' do
    visit root_path
    expect(page).to have_content('Nenhum imóvel disponível')
  end

  it 'and view property details' do
    property_type = PropertyType.create!(name: 'Casa')
    Property.create!({ title: 'Casa com quintal em Copacabana',
                       description: 'Excelente casa, recém reformada com 2 vagas de garagem',
                       rooms: 3, parking_slot: true, bathrooms: 2, pets: true, daily_rate: 500,
                       property_type: property_type, property_location: PropertyLocation.new(name: 'Sudeste') })

    visit root_path
    click_on 'Casa com quintal em Copacabana'

    expect(page).to have_content('Casa com quintal em Copacabana')
    expect(page).to have_content('Excelente casa, recém reformada com 2 vagas de garagem')
    expect(page).to have_content('Quartos: 3')
    expect(page).to have_content('Banheiros: 2')
    expect(page).to have_content('Aceita Pets: Sim')
    expect(page).to have_content('Estacionamento: Sim')
    expect(page).to have_content('Diária: R$ 500,00')
    expect(page).to have_content('Tipo: Casa')
  end

  it 'and view property details and return to home page' do
    property_type = PropertyType.create!(name: 'Casa')
    property_location = PropertyLocation.create!(name: 'Brasil')
    Property.create!({ title: 'Casa com quintal em Copacabana',
                       description: 'Excelente casa, recém reformada com 2 vagas de garagem',
                       rooms: 3, parking_slot: true, bathrooms: 2, pets: true, daily_rate: 500,
                       property_type: property_type, property_location: property_location })
    Property.create!({ title: 'Cobertura em Manaus',
                       description: 'Cobertura de 300m2, churrasqueira e sauna privativa',
                       bathrooms: 2, pets: true, daily_rate: 500,
                       rooms: 5, parking_slot: false, property_type: property_type,
                       property_location: property_location })

    visit root_path
    click_on 'Casa com quintal em Copacabana'
    click_on 'Voltar'

    expect(current_path).to eq root_path
    expect(page).to have_content('Casa com quintal em Copacabana')
    expect(page).to have_content('Cobertura em Manaus')
  end
end
