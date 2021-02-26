# frozen_string_literal: true

require 'rails_helper'

feature 'User can see stock' do
  given!(:user) { create(:user) }
  let!(:stock) { create(:stock) }

  context 'when user signed in' do
    before { sign_in(user) }
    let!(:price) { create(:price, value: '100', stock: stock) }

    scenario 'try to see stock info' do
      visit stocks_path
      within ".stock_#{stock.id}" do
        click_on 'show'
      end
      expect(page).to have_content stock.ticker
      expect(page).to have_content stock.open
      expect(page).to have_content stock.day_high
      expect(page).to have_content stock.day_low
      expect(page).to have_content stock.prev_close
      expect(page).to have_content stock.market_capitalization
      expect(page).to have_content stock.size
      expect(page).to have_content stock.change_per_year
      expect(page).to have_content price.value
    end
  end

  context 'when guest' do
    scenario 'try to see stock info' do
      visit stock_path(stock)
      within '.flash_messages' do
        expect(page).to have_content 'Access denied. You need to authorize'
      end
    end
  end
end
