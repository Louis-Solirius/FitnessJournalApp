class AddProviderToUsers < ActiveRecord::Migration[7.1]
  def change
    unless column_exists? :users, :provider
      add_column :users, :provider, :string
    end
  end
end
