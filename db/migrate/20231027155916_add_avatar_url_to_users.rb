class AddAvatarUrlToUsers < ActiveRecord::Migration[7.1]
  def change
    unless column_exists? :users, :avatar_url
      add_column :users, :avatar_url, :string
    end
  end
end
