# frozen_string_literal: true

# Product model
class Product < ApplicationRecord
  validates :name, :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
end
