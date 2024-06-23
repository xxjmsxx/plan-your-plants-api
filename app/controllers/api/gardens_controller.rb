module Api
  class GardensController < ApplicationController
    def index
      @gardens = Garden.where(user_id: current_user.id)
      render json: @gardens
    end

    def show
    end

    def create
      @garden = Garden.new(garden_params)
      @garden.user_id = current_user.id

      if @garden.save
        render json: @garden
      else
        render json: { error: 'Unable to create garden' }, status: :unprocessable_entity
      end
    end

    def update
    end

    def destroy
      @garden = Garden.find(params[:id])
      @garden.destroy
    end

    private

    def garden_params
      params.require(:garden).permit(:name, :location, :category, :size)
    end
  end
end
