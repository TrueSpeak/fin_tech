# frozen_string_literal: true

require 'rails_helper'

feature 'User can sign in' do
  describe 'existed user' do
    given!(:user) { create(:user) }
    before { visit root_path }

    context 'when data is correct' do
      scenario 'tries to sign in' do
        expect(page).to have_link 'Sign in'
        click_on 'Sign in'
        expect(page).to have_content 'Email'
        expect(page).to have_content 'Password'
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
        click_on 'Log in'
        expect(page).to have_content 'Signed in successfully.'
      end
    end

    context 'when data is incorrect' do
      scenario 'tries to sign in' do
        expect(page).to have_link 'Sign in'
        click_on 'Sign in'
        expect(page).to have_content 'Email'
        expect(page).to have_content 'Password'
        fill_in 'Email', with: user.email
        fill_in 'Password', with: 'incorrect password'
        click_on 'Log in'
        expect(page).to have_content 'Invalid Email or password.'
      end
    end
  end
end
