class CreateWorkouts < ActiveRecord::Migration[7.1]
  def change
    create_table :workouts do |t|
      t.date :date
      t.string :notes

      t.timestamps
    end
  end
end
