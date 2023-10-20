class WorkoutsController < ApplicationController
    def index
        @workouts = Workout.all
    end

    def show
        @workout = Workout.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        redirect_to root_path
    end

    def new
        @workout = Workout.new
    end

    def create
        @workout = Workout.new(workout_params)
        if @workout.save
            redirect_to @workout
        else
            render :new, status: :unprocessable_entity 
        end
    end

    private

    def workout_params
        params.require(:workout).permit(:date, :notes, :title) 
    end
end