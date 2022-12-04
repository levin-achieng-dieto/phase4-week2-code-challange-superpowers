class HerosController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :rescue_not_found_record
    
    def index
        render json: Hero.all, status: :ok
    end

    def show
        hero = Hero.find(params[:id])
        render json: hero, serializer: HeroWithPowerSerializer
    end

    private

    def rescue_not_found_record
        render json: {error: "Herro not found"}, status: :not_found
    end
end
