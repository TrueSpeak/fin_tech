require 'rails_helper'

RSpec.describe StocksController, type: :controller do
  let!(:user) { create(:user) }

  describe "GET #show" do
    let!(:stock) { create(:stock) }
    context "when guest tries to get show stock" do
      before do
        get :show, params: { id: stock.id }
      end

      it 'redirect to root path' do
        expect(response).to redirect_to root_path
      end
    end

    context "when user tries to get show stock" do
      before do
        CnbcStocksParser.new('AAPL').call
        login(user)
        get :show, params: { id: stock.id }
      end

      it 'render show view' do
        expect(response).to render_template(:show)
      end
    end
  end

  describe "GET #index" do
    let!(:stocks) { create_list(:stock, 3) }

    context "when guest tries to get index stocks" do
      before do
        get :index
      end

      it 'redirect to root path' do
        expect(response).to redirect_to root_path
      end
    end

    context "when authenticated user tries to get index stocks" do
      before do
        login(user)
        get :index
      end

      it 'render show view' do
        expect(response).to render_template(:index)
      end

      it 'match array Notes' do
        expect(stocks).to match_array(Stock.all)
      end
    end
  end
end