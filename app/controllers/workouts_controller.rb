class WorkoutsController < ApplicationController

    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_workout, except: [:index, :new, :create]
    before_action :correct_user, only: [:edit, :update, :destroy, :show]

    def index
        @workouts = Workout.all
        ActiveRecord::Base.connection.tables
    end

    def show
    end

    def new
        #@workout = Workout.new
        @workout = current_user.workouts.build
    end

    def create
        #@workout = Workout.new(workout_params)
        @workout = current_user.workouts.build(workout_params)

        if @workout.save
            redirect_to(@workout, :notice => 'New workout created')
        else
            render :new, status: :unprocessable_entity 
        end
    end

    def edit
    end

    def update
        if @workout.update(workout_params)
            redirect_to(@workout, :notice => 'Workout updated')
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @workout.destroy
        redirect_to(root_path, :notice => 'Workout deleted')
    end

    def correct_user
        @workout = current_user.workouts.find_by(id: params[:id])
        redirect_to workouts_path, notice: "Not Authorised to view or edit this workout" if @workout.nil?
    end

    private

    def workout_params
        params.require(:workout).permit(:date, :notes, :title, :user_id) 
    end

    def set_workout
        @workout = Workout.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        redirect_to root_path
    end
end