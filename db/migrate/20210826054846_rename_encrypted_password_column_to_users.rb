class RenameEncryptedPasswordColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :encrypted_password, :encrypted_password
  end
end
