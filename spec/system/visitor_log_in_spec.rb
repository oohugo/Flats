require 'rails_helper'

describe 'Visitor log in' do
  it 'successfully' do
    user = User.create!(email: 'user@user.com.br', password: '123456')

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Entar'

    expect(page).to have_content('Logou com sucesso')
    expect(page).to have_content(user.email)
    expect(page).to have_content('Logout')
    expect(page).not_to have_content('Entrar')
  end
end
