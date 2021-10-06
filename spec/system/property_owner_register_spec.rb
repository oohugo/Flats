# coding: utf-8
require 'rails_helper'

describe 'Property Owner create register of himself' do
  it 'has a page for create' do
    visit root_path
    click_on 'Cadastro como Proprietário'

    expect(page).to have_content('Email')
    expect(page).to have_content('Senha')
  end
end
