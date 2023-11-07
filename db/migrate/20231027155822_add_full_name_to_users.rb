class AddFullNameToUsers < ActiveRecord::Migration[7.1]
  def change
    unless column_exists? :users, :full_name
      add_column :users, :full_name, :string
    end
  end
end
