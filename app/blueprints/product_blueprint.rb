# frozen_string_literal: true

# Blueprint serializer for product
class ProductBlueprint < Blueprinter::Base
  identifier :id
  fields :name, :description, :price
end
