# frozen_string_literal: true

module Api
  module V1
    # Products controller
    class ProductsController < ApplicationController
      include Paginable

      before_action :set_product, only: %i[show update destroy]
      def index
        @products = Product.all.page(params[:page])
                           .per(params[:per_page])

        render json: ProductBlueprint.render(@products), status: :ok
      end

      def show
        render json: ProductBlueprint.render(@set_product)
      end

      def create
        product = Product.build(product_params)
        if product.save
          render json: ProductBlueprint.render(product), status: :created
        else
          render json: { errors: product.errors }, status: :unprocessable_entity
        end
      end

      def update
        if @set_product.update(product_params)
          render json: ProductBlueprint.render(@set_product), status: :ok
        else
          render json: { errors: @set_product.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        @set_product.destroy

        head 204
      end

      private

      def product_params
        params.require(:product).permit(:name, :description, :price)
      end

      def set_product
        @set_product ||= Product.find(params[:id])
      end
    end
  end
end
