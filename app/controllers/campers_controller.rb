class CampersController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :invalid
rescue_from ActiveRecord::RecordNotFound, with: :norecord
    def index
        render json: Camper.all
    end

    def show
        render json: Camper.find(params[:id])
    end

    def create
        render json: Camper.create!(priv_params), status: :created
    end

    private

    def priv_params
        params.permit(:name, :age)
    end

    def invalid
        render json: {errors: "validation errors"}, status: 422
    end

    def norecord
        render json: {error: "camper not found"}, status: 404
    end
end

