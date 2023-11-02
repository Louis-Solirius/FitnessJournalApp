class CreateBodyWeights < ActiveRecord::Migration[7.1]
  def change
    create_table :body_weights do |t|
      t.date :date
      t.integer :weight

      t.timestamps
    end
  end
end
