# coding: utf-8
require 'rails_helper'

describe 'Visitor registry property' do
  it 'successifully' do
    PropertyType.create!(name: 'Casa')
    PropertyLocation.create!(name: 'Sul')

    visit root_path
    click_on 'Cadastrar Imóvel'
    fill_in 'Título', with: 'Casa em Florianópolis'
    fill_in 'Descrição', with: 'Ótima casa perto do UFSC'
    fill_in 'Quartos', with: '3'
    fill_in 'Banheiros', with: '2'
    fill_in 'Diária', with: '200'
    select 'Casa', from: 'Tipo'
    select 'Sul', from: 'Região'
    check 'Aceita Pets'
    check 'Vaga de Estacionamento'
    click_on 'Enviar'

    expect(page).to have_content('Casa em Florianópolis')
    expect(page).to have_content('Ótima casa perto do UFSC')
    expect(page).to have_content('Quartos: 3')
    expect(page).to have_content('Banheiros: 2')
    expect(page).to have_content('Aceita Pets: Sim')
    expect(page).to have_content('Estacionamento: Sim')
    expect(page).to have_content('Diária: R$ 200,00')
    expect(page).to have_content('Região: Sul')
  end
end
