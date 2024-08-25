# frozen_string_literal: true

module Api
  module V1
    # Users controller
    class UsersController < ApplicationController
      skip_before_action :authenticate, only: [:create]

      def create
        user = User.create!(user_params)

        render json: UserBlueprint.render(user), status: :created
      end

      private

      def user_params
        params.require(:user).permit(:email, :password)
      end
    end
  end
end
