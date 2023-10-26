class CreateExercises < ActiveRecord::Migration[7.1]
  def change
    create_table :exercises do |t|
      t.string :name
      t.integer :sets
      t.integer :reps
      t.integer :rpe
      t.integer :weight
      t.belongs_to :workout, null: false, foreign_key: true

      t.timestamps
    end
  end
end
