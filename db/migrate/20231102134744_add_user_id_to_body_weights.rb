class AddUserIdToBodyWeights < ActiveRecord::Migration[7.1]
  def change
    add_column :body_weights, :user_id, :integer
    add_index :body_weights, :user_id
  end
end
