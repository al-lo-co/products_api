# frozen_string_literal: true

# Blueprint serializer for user
class UserBlueprint < Blueprinter::Base
  identifier :id
  fields :email

  field :token do |user|
    JWT.encode(user.id, ENV['AUTHENTICATION_TOKEN'])
  end
end
