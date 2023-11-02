class SearchController < ApplicationController
  def index
    @query = Workout.ransack(params[:q])
    @workouts = @query.result(distinct: true)
  end
end
