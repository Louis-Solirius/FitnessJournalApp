class AddTitleToWorkouts < ActiveRecord::Migration[7.1]
  def change
    add_column :workouts, :title, :string
  end
end
