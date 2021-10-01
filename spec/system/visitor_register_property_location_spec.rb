# coding: utf-8
require 'rails_helper'

describe 'Visitor registry Property Location' do
  it 'successfully created' do
    visit root_path

    click_on 'Cadastrar Região'
    fill_in 'Nome', with: 'Recife'
    click_on 'Enviar'

    expect(page).to have_current_path(root_path)
    expect(page).to have_css('li', text: 'Recife')
  end

  it 'cannot save empty name' do
    visit root_path

    click_on 'Cadastrar Região'
    fill_in 'Nome', with: ' '
    click_on 'Enviar'

    expect(page).to have_css('h1', text: 'Cadastrar Regiões:')
    expect(page).to have_content('não pode ficar em branco')
  end

  it 'name must be unique' do
    PropertyLocation.create(name: 'Recife')

    visit root_path
    click_on 'Cadastrar Região'
    fill_in 'Nome', with: 'Recife'
    click_on 'Enviar'

    expect(page).to have_css('h1', text: 'Cadastrar Regiões:')
    expect(page).to have_content('já está em uso')
  end
end
