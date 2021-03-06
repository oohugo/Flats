# coding: utf-8
require 'rails_helper'

describe 'Property Owner register property' do
  it 'must be signed in' do
    visit root_path
    expect(page).not_to have_link('Cadastrar Imóvel')
  end

  it 'successfully' do
    property_owner = PropertyOwner.create!(email: 'jane@doe.com.br', password: '123456789')
    PropertyType.create!(name: 'Casa')
    PropertyLocation.create!(name: 'Recife')

    login_as property_owner, scope: :property_owner
    visit root_path
    click_on 'Cadastrar Imóvel'

    fill_in 'Título', with: 'Casa em Florianópolis'
    fill_in 'Descrição', with: 'Ótima casa perto da UFSC'
    fill_in 'Quartos', with: '3'
    fill_in 'Banheiros', with: '2'
    fill_in 'Diária', with: 200
    select 'Casa', from: 'Tipo'
    select 'Recife', from: 'Região'
    check 'Aceita Pets'
    check 'Vaga de Estacionamento'
    click_on 'Enviar'

    expect(page).to have_content('Casa em Florianópolis')
    expect(page).to have_content('Ótima casa perto da UFSC')
    expect(page).to have_content('Quartos: 3')
    expect(page).to have_content('Banheiros: 2')
    expect(page).to have_content('Aceita Pets: Sim')
    expect(page).to have_content('Estacionamento: Sim')
    expect(page).to have_content('Diária: R$ 200,00')
    expect(page).to have_content('Tipo: Casa')
    expect(page).to have_content('Imóvel de: jane@doe.com.br')
  end

  it 'and must fill all fields' do
    property_owner = PropertyOwner.create!(email: 'jane@doe.com.br', password: '123456789')
    login_as property_owner, scope: :property_owner

    visit root_path
    click_on 'Cadastrar Imóvel'
    click_on 'Enviar'

    expect(page).to have_content('Título não pode ficar em branco')
    expect(page).to have_content('Descrição não pode ficar em branco')
    expect(page).to have_content('Quartos não pode ficar em branco')
    expect(page).to have_content('Banheiros não pode ficar em branco')
    expect(page).to have_content('Diária não pode ficar em branco')
    expect(Property.count).to eq(0)
  end

  it 'and rooms, daily_rate and bathrooms have to be greater than zero' do
    property_owner = PropertyOwner.create!(email: 'jane@doe.com.br', password: '123456789')
    PropertyType.create!(name: 'Casa')
    PropertyLocation.create!(name: 'Recife')

    login_as property_owner, scope: :property_owner
    visit root_path
    click_on 'Cadastrar Imóvel'

    fill_in 'Título', with: 'Casa em Florianópolis'
    fill_in 'Descrição', with: 'Ótima casa perto da UFSC'
    fill_in 'Quartos', with: '-1'
    fill_in 'Banheiros', with: '-2'
    fill_in 'Diária', with: -200
    select 'Casa', from: 'Tipo'
    select 'Recife', from: 'Região'
    check 'Aceita Pets'
    check 'Vaga de Estacionamento'
    click_on 'Enviar'

    expect(page).to have_content('Quartos deve ser maior que 0')
    expect(page).to have_content('Banheiros deve ser maior que 0')
    expect(page).to have_content('Diária deve ser maior que 0')
  end
end
