class ActivitiesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :norecord
    def index
        render json: Activity.all
    end

    def show
        render json: Activity.find(params[:id])
    end
    
    def update
        render json: Activity.find(params[:id]).update!(priv_params)
    end

    def destroy
        render json: Activity.find(params[:id]).destroy
    end

    private

    def priv_params
        params.permit(:name, :difficulty)
    end

    def norecord
        render json: {error: "Activity not found"}, status: 404
    end

end
