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
end
