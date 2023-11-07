class AddUidToUsers < ActiveRecord::Migration[7.1]
  def change
    unless column_exists? :users, :uid
      add_column :users, :uid, :string
    end
  end
end
