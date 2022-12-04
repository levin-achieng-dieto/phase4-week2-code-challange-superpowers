class PowersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_not_found_record
rescue_from ActiveRecord::RecordInvalid, with: :rescue_from_invalid_record

    def index
        render json: Power.all, status: :ok
    end

    def show
        power = Power.find(params[:id])
        render json: power, status: :ok
    end

    def update
        power = Power.find(params[:id])
        power.update(power_params)
        render json: power
    end

    private

    def power_params
        params.permit(:description)
    end

    def rescue_from_not_found_record
        render json: {error: "Power not found"}, status: :not_found
    end

    def rescue_from_invalid_record
        render json: {errors: ["Validation errors"]}, status: :unprocessable_entity
    end

end
