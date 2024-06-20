module Api
  class GardensController < ApplicationController
    def index
      @gardens = Garden.where(user_id: current_user.id)
      render json: @gardens
    end

    def show
    end

    def create
    end

    def update
    end

    def destroy
    end
  end
end
