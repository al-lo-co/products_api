# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.float :price, null: false

      t.timestamps
    end
  end
end
