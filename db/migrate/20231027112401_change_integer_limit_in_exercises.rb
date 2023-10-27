class ChangeIntegerLimitInExercises < ActiveRecord::Migration[7.1]
  def change
    change_column :exercises, :sets, :integer, limit: 8
    change_column :exercises, :reps, :integer, limit: 8
    change_column :exercises, :rpe, :integer, limit: 8
    change_column :exercises, :weight, :integer, limit: 8
  end
end
