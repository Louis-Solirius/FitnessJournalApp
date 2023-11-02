class SearchController < ApplicationController
  def index
    @query = current_user.workouts.ransack(params[:q])
    @workouts = @query.result(distinct: false)
  end
end
