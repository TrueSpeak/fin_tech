# frozen_string_literal: true

class Stock < ApplicationRecord
  has_many :prices
end
