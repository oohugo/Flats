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
end
