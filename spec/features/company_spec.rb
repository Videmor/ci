# encoding: utf-8
require 'rails_helper'


feature 'Company' do

  scenario 'create a company' do
    visit companies_path
    expect(page).to have_content('Companies')

    click_link 'New Company'

    fill_in 'Name', with: 'Netflix'
    fill_in 'Url', with: 'http://www.netflix.com'
    fill_in 'Description', with: 'lorem' * 4

    click_button 'Create Company'

    expect(page).to have_content('successfully created')
    expect(page).to have_content('Netflix')
    expect(page).to have_link('Edit')

    click_link 'Edit'

    fill_in 'Description', with: 'Plataforma de películas'
    click_button 'Update Company'

    expect(page).to have_content('successfully updated')
    expect(page).to have_content('Plataforma de películas')

  end

  scenario 'message erro when create company is not valid' do
    visit companies_path
    company = create(:company, url: 'http://www.netflix.com')

    click_link 'New Company'
    fill_in 'Name', with: 'Netflix'
    fill_in 'Url', with: 'http://www.netflix.com'
    fill_in 'Description', with: 'lorem' * 4

    click_button 'Create Company'

    expect(page).to have_content('Url has already been taken')
  end


end
