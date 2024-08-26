# frozen_string_literal: true

# spec/models/product_spec.rb
require 'rails_helper'

RSpec.describe Product do
  subject { described_class.new(name: 'Sample Product', description: 'This is a sample product', price: 10.0) }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a description' do
      subject.description = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a price' do
      subject.price = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with a non-numerical price' do
      subject.price = 'ten'
      expect(subject).to_not be_valid
    end

    it 'is not valid with a price less than or equal to 0' do
      subject.price = 0
      expect(subject).to_not be_valid

      subject.price = -1
      expect(subject).to_not be_valid
    end
  end
end
