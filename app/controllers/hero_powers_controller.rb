class HeroPowersController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :rescue_from_invalid_record
    
    def create
        hero_power = HeroPower.create(params.permit(:strength, :power_id, :hero_id))
        render json: hero_power.hero, serializer: HeroWithPowerSerializer
    end

    private

    def rescue_from_invalid_record
        render json: {errors: ["validation errors"]}, status: :unprocessable_entity
    end
end
