module Api
  module V1
    class OrdersController < ApplicationController
      before_action :check_login, only: %i[index]

      def index
        render json: OrderSerializer.new(current_user.orders).serializable_hash.to_json
      end
    end
  end
end
