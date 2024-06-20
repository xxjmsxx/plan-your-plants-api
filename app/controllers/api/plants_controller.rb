module Api
  class PlantsController < ApplicationController
    def index
      plants = Plant.all
      render json: plants
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
