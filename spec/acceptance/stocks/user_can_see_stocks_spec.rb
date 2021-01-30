require 'rails_helper'

feature 'User can see stocks' do
  given!(:user) { create(:user) }

  context 'when user signed in' do
    before { sign_in(user) }
    let!(:stocks) { create_list(:stock, 3) }
    let!(:price_1) { create(:price, value: '100', stock: stocks.first) }
    let!(:price_2) { create(:price, value: '110', stock: stocks.second) }
    let!(:price_3) { create(:price, value: '120', stock: stocks.last) }

    scenario 'see list of stocks' do
      visit stocks_path
      stocks.each do |stock|
        expect(page).to have_css ".stock_#{stock.id}"
        within ".stock_#{stock.id}" do
          expect(page).to have_content stock.prices.last.value
          expect(page).to have_link 'show'
        end
      end
    end
  end

  context 'when guest' do
    scenario 'try to see list of stocks' do
      visit stocks_path
      expect(page).to have_content 'Access denied. You need to authorized'
    end
  end
end
