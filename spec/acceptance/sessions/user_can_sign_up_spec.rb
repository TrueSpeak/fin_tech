# frozen_string_literal: true

require 'rails_helper'

feature 'User can sign up' do
  before { visit root_path }

  scenario 'successfully sign up' do
    expect(page).to have_link 'Sign up'
    click_on 'Sign up'
    expect(page).to have_content 'Email'
    expect(page).to have_content 'Password'
    expect(page).to have_content 'Password confirmation'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'test_password'
    fill_in 'Password confirmation', with: 'test_password'
    within '.actions' do
      click_on 'Sign up'
    end
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  scenario 'failure sign up' do
    expect(page).to have_link 'Sign up'
    click_on 'Sign up'
    expect(page).to have_content 'Email'
    expect(page).to have_content 'Password'
    expect(page).to have_content 'Password confirmation'
    fill_in 'Email', with: 'testtestcom'
    fill_in 'Password', with: 'test_password'
    fill_in 'Password confirmation', with: 'test_password'
    within '.actions' do
      click_on 'Sign up'
    end
    expect(page).to have_content 'Email is invalid'
  end
end
