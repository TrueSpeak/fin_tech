# frozen_string_literal: true

class StocksController < ApplicationController
  before_action :authenticate!

  def index
    @stocks = Stock.all
  end

  def show
    @stock = Stock.find(params[:id])
  end
end
