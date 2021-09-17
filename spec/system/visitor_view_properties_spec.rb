# coding: utf-8
require 'rails_helper'

describe 'Visitor view Home' do
  it 'and view properties' do
    Property.create({ title: 'casa com quintal em Copacabana',
                      description: 'Excelente casa, recem formada com 2 vagas de caragem',
                      rooms: 3 })

    Property.create({ title: 'coberura em Manaus',
                      description: 'Cobertura de 300m2, churrascaria',
                      rooms: 5 })

    visit root_path
    expect(page).to have_text('casa com quintal em Copacabana')
    expect(page).to have_text('Excelente casa, recem formada com 2 vagas de caragem')
    expect(page).to have_text('Quartos: 3')
    expect(page).to have_text('coberura em Manaus')
    expect(page).to have_text('Cobertura de 300m2, churrascaria')
    expect(page).to have_text('Quartos: 5')
  end

  it 'and theres no property available' do
    visit root_path
    expect(page).to have_text('Nenhum imóvel disponível')
  end

  it 'and view property details' do
    Property.create({ title: 'Casa com quintal em Copacabana',
                      description: 'Excelente casa, recém reformada com 2 vagas de garagem',
                      rooms: 3, parking_slot: true, bathrooms: 2, pets: true, daily_rate: 500 })

    visit root_path
    click_on 'Casa com quintal em Copacabana'

    expect(page).to have_text('Casa com quintal em Copacabana')
    expect(page).to have_text('Excelente casa, recém reformada com 2 vagas de garagem')
    expect(page).to have_text('Quartos: 3')
    expect(page).to have_text('Banheiros: 2')
    expect(page).to have_text('Aceita Pets: Sim')
    expect(page).to have_text('Estacionamento: Sim')
    expect(page).to have_text('Diária: R$ 500')
  end
end
