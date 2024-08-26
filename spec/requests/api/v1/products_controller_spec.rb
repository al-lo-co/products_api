require 'rails_helper'

RSpec.describe Api::V1::ProductsController do
  let!(:products) { create_list(:product, 10) }
  let(:product_id) { products.first.id }
  let!(:user) { create(:user) }
  let(:headers) { valid_headers(user) }

  describe 'GET /api/v1/products' do
    before { get api_v1_products_path, headers: }
    it 'returns products' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /api/v1/products/:id' do
    before { get api_v1_product_path(id: product_id), headers: }

    context 'when the record exists' do
      it 'returns the product' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(product_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:product_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Product/)
      end
    end
  end

  describe 'POST /api/v1/products' do
    let(:name) { Faker::Name.name }
    let(:description) { Faker::Quotes::Chiquito.joke }
    let(:price) { Faker::Number.number(digits: 5) }
    let(:valid_attributes) { { name:, description:, price: } }

    context 'when the request is valid' do
      before { post api_v1_products_path, params: { product: valid_attributes }.to_json, headers: }

      it 'creates a product' do
        expect(json['name']).to eq(name)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post api_v1_products_path, params: { product: { name: Faker::Name.name } }.to_json, headers: }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'PUT /api/v1/products/:id' do
    let(:valid_attributes) { { name: Faker::Name.name } }

    context 'when the record exists' do
      before { put api_v1_product_path(id: product_id), params: { product: valid_attributes }.to_json, headers: }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'DELETE /api/v1/products/:id' do
    before { delete api_v1_product_path(id: product_id), headers: }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
