class SignupsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :invalid
rescue_from ActiveRecord::RecordNotFound, with: :norecord

    def show
        render json: Signup.find(params[:id])
    end

    def create
        render json: Signup.create!(priv_params), status: :created
    end

    def update
        render json: Signup.find(params[:id]).update!(priv_params)
    end

    def destroy
        render json: Signup.find(params[:id]).destroy
    end

    private

    def priv_params
        params.permit(:camper_id, :activity_id, :time)
    end

    def invalid
        render json: {errors: "validation errors"}, status: 422
    end

    def norecord
        render json: {error: "signup not found"}, status: 404
    end

end
