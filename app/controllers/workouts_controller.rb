class WorkoutsController < ApplicationController
    def index
        @workouts = Workout.all
    end

    def show
        @workout = Workout.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        redirect_to root_path
    end
end
