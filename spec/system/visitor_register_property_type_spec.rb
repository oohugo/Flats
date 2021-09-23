# coding: utf-8
require 'rails_helper'

describe 'Visitor registry property_type' do
  it 'Create successfully' do
    visit root_path
    click_on 'Cadastrar Tipos de Imoveis'
    fill_in 'Nome', with: 'Casa'
    click_on 'Enviar'

    expect(page).to have_current_path(root_path)
    expect(page).to have_css 'li', text: 'Casa'
  end

  it 'Cannot send name empty' do
    visit root_path
    click_on 'Cadastrar Tipos de Imoveis'
    fill_in 'Nome', with: ' '
    click_on 'Enviar'
    # expect(page).to have_current_path(new_property_type_path)
    expect(page).to have_css('h1', text: 'Cadastrar um novo Tipo de Imóvel')
    expect(page).to have_content('Nome deve estar preenchido')
  end

  it 'Name must be unique' do
    PropertyType.create(name: 'Casa')

    visit root_path
    click_on 'Cadastrar Tipos de Imoveis'
    fill_in 'Nome', with: 'Casa'
    click_on 'Enviar'

    expect(page).to have_css('h1', text: 'Cadastrar um novo Tipo de Imóvel')
    expect(page).to have_content('Nome deve ser único')
  end
end
